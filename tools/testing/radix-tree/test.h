#include <linux/gfp.h>
#include <linux/types.h>
#include <linux/radix-tree.h>
#include <linux/rcupdate.h>

struct item {
	unsigned long index;
	unsigned int order;
};

struct item *item_create(unsigned long index, unsigned int order);
int __item_insert(struct radix_tree_root *root, struct item *item);
int item_insert(struct radix_tree_root *root, unsigned long index);
int item_insert_order(struct radix_tree_root *root, unsigned long index,
			unsigned order);
int item_delete(struct radix_tree_root *root, unsigned long index);
struct item *item_lookup(struct radix_tree_root *root, unsigned long index);

void item_check_present(struct radix_tree_root *root, unsigned long index);
void item_check_absent(struct radix_tree_root *root, unsigned long index);
void item_gang_check_present(struct radix_tree_root *root,
			unsigned long start, unsigned long nr,
			int chunk, int hop);
void item_full_scan(struct radix_tree_root *root, unsigned long start,
			unsigned long nr, int chunk);
void item_kill_tree(struct radix_tree_root *root);

int tag_tagged_items(struct radix_tree_root *, pthread_mutex_t *,
			unsigned long start, unsigned long end, unsigned batch,
			unsigned iftag, unsigned thentag);
unsigned long find_item(struct radix_tree_root *, void *item);

void tag_check(void);
void multiorder_checks(void);
void iteration_test(unsigned order, unsigned duration);
void benchmark(void);

struct item *
item_tag_set(struct radix_tree_root *root, unsigned long index, int tag);
struct item *
item_tag_clear(struct radix_tree_root *root, unsigned long index, int tag);
int item_tag_get(struct radix_tree_root *root, unsigned long index, int tag);
void tree_verify_min_height(struct radix_tree_root *root, int maxindex);
void verify_tag_consistency(struct radix_tree_root *root, unsigned int tag);

extern int nr_allocated;

/* Normally private parts of lib/radix-tree.c */
struct radix_tree_node *entry_to_node(void *ptr);
void radix_tree_dump(struct radix_tree_root *root);
int root_tag_get(struct radix_tree_root *root, unsigned int tag);
unsigned long node_maxindex(struct radix_tree_node *);
unsigned long shift_maxindex(unsigned int shift);
int radix_tree_cpu_dead(unsigned int cpu);
struct radix_tree_preload {
	unsigned nr;
	struct radix_tree_node *nodes;
};
extern struct radix_tree_preload radix_tree_preloads;
