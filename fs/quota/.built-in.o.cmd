cmd_fs/quota/built-in.o :=  ld -m elf_x86_64   -r -o fs/quota/built-in.o fs/quota/dquot.o fs/quota/quota_v1.o fs/quota/quota_v2.o fs/quota/quota_tree.o fs/quota/quota.o fs/quota/kqid.o fs/quota/netlink.o 