Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57673C86576
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MI4pSj0Uus8dKFGDI+dHQi4KpvMST1oOMMgUTpM/+sw=; b=IMJeqntcaxSfRKM+X4mmuhgRdk
	ER6nLvQ9PBWSfgAuVyKA42dkFteTKaQK0fJZ7AbGMqFPu9FA395nT+FeB/p0HSpl6cSY2rBmGaWHQ
	sgHYDu2G0jy4IVxI4j0yK948LjeySc7i5eTBZ6CEaogV4e+dRqKLEI4DIlipLCu28+/1E1TxGMkKF
	KHRR1YSnDtuK+879h4u+QeVNIGKwhRmQIKpRdrJK3o5cjE8DNHMIr7ESEKQZVyr84cRvSbZ62lbW5
	UbibuKkxoHeonF4Me/aDuBME8Qg0grhZBFUJj8stdfox2vFjfBDIjUpYdFPzCxfA5VpTSKLZsw6BN
	Eulm/7Nw==;
Received: from ip6-localhost ([::1]:48786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxHU-00D6XK-1a; Tue, 25 Nov 2025 17:56:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36270) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHO-00D6XC-Mq
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=MI4pSj0Uus8dKFGDI+dHQi4KpvMST1oOMMgUTpM/+sw=; b=2iq6Y6DgdCt1gFThyzmZB878iH
 aWyZEZp4JSboH9/kQlFE5FhBOI5inMPl5J40qi2DCacNdeEx8rnBL4rlOnF7H4p7uskWn2Qnkjgv/
 Rw23M+zopJZ0KUS/yxXFm0hU0pHnM5/iRyNR8JJegx3Jyp22GiCXuvoyJNFZjhckm7x7z3JQBvD9n
 ZlZFU+8a3onXCnSQK7xXY0jPCaxnQPimf31gWmPsfaof7e+3tjRRxzRyyPZ94nyQ60Txld3h2A//5
 5E1QZa40+kjWeMcZYDITssmNC4UKRdlAlV8czEdznxxnfH3XruWRszirvYKoMhkLLqJNoOV7RrpAh
 klXXmHVIqZwjzpiqTQebrMpnuy0TXvHXQJhJvhqVk8Cna4a2HF2iiol+R5xLJtYFdlF1oU5NC+Jie
 4vWC81uuUGP+mfg8D/dl1HuRwlBugp73eiuCdwsyMJJBm49amireVFY2E8bW7Sj6Z3erMwgL8OC74
 Mo3Ex+yrVmlwB1rBxA/nIhL9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHN-00FcSZ-01; Tue, 25 Nov 2025 17:56:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 000/145] smb: smbdirect/client/server: moving to common
 functions and smbdirect.ko
Date: Tue, 25 Nov 2025 18:54:06 +0100
Message-ID: <cover.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is the move use common functions in an smbdirect.ko.

It can also be found in my for-6.19/fs-smb-20251125-v4 branch,
at commit d72b76bd33831f43c2b1fef74619eca20236ba6b:
git fetch https://git.samba.org/metze/linux/wip.git for-6.19/fs-smb-20251125-v4
https://git.samba.org/?p=metze/linux/wip.git;a=shortlog;h=refs/heads/for-6.19/fs-smb-20251125-v4

It is based on dhowells-linux-fs/cifs-cleanup
at commit 1bc2089694a33afb711779dfcb4bbbe10ccbe466,
which is based on smfrench-smb3-kernel/ksmbd-for-next
at commit f9fd35675dbd6f6acbb7535f951b6d651b06eb7c.

On top of this I have the 4 patches from:
https://lore.kernel.org/linux-cifs/cover.1764080338.git.metze@samba.org/
  smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
  smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
  smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
    recv_done() and smb_direct_cm_handler()
  smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
    recv_done() and smbd_conn_upcall()

Up to commit 78d3a80b0c86e690867d5f8b7ce6920539591aa6 in
my for-6.19/fs-smb-20251125-v4.

The end goal is still to go via the socket layer in order
to provide smbdirect support to userspace, so that Samba
can use if as client and server. But that will be done on
top of this patchset.

The patchset starts with the introduction of
a logging infrastructure that allows us to have
common code, but still do logging with cifs.ko
and ksmbd.ko specific functions.

Then it introduces smbdirect_all_c_files.c, which
is only temporary. It is included in the client and
server and will itself include more files with
common functions in the following patches.
This makes it possible to do the transition in
small steps. At the end this will be removed again,
while removing the file itself will be done in a later
patchset.

Then we have a series of patches introducing
common functions, most of them are copies
of the existing functions, just with a new name
and some reformatting. But the core logic is
mostly unchanged.

Then we have new functions related to async
connect and accept handling.

Followed by preparing some functions as public
and some as private, so that we have the
Kbuild logic for smbdirect.ko, which is
still disabled at that point.

Then we have small steps in the client in order
to make use of the new functions. At the end
is only uses smbdirect.ko and its exported functions.

Then we have small steps in the server in order
to make use of the new functions. At the end
is only uses smbdirect.ko and its exported functions.

Then there's the move to global workqueues in
smbdirect.ko.

The addition of smbdirect_{bind,listen,accept}()
function and the transition of the server to
use them instead of the custom rdma listener.

Finally some unused stuff is removed.

Every patch compiles on its own and passes
  grep -v 'Fixes: 0626e6641f6b ' | \
    scripts/checkpatch.pl --quiet --codespell \
      --ignore=FILE_PATH_CHANGES,EXPORT_SYMBOL,COMPLEX_MACRO

I've tested these tests at the end of the
patchset with siw and rxe:

cifs/001
generic/001
generic/002
generic/005
generic/006
generic/007
generic/008
generic/011
generic/024
generic/028
generic/029
generic/030
generic/033
generic/036
generic/069
generic/071
generic/080
generic/084
generic/086
generic/095
generic/098
generic/103
generic/124
generic/130
generic/132
generic/135
generic/141
generic/198
generic/207
generic/210
generic/212
generic/214
generic/215
generic/221
generic/228
generic/236
generic/246
generic/248
generic/249
generic/257
generic/258
generic/308
generic/309
generic/313
generic/315
generic/339
generic/340
generic/344
generic/345
generic/346
generic/354
generic/360
generic/390
generic/391
generic/393
generic/394
generic/406
generic/412

Assuming we want the relax WARN_ON_ONCE patches from:
https://lore.kernel.org/linux-cifs/cover.1764080338.git.metze@samba.org/
in 6.18, can we please get everything up to commit
78d3a80b0c86e690867d5f8b7ce6920539591aa6 into
ksmbd-for-next. And once it was in linux-next for
one interation, we can put the full set into
ksmbd-for-next.

Note that cifs: Use netfs_alloc/free_folioq_buffer()
should be removed from for-next, as that
will already be in ksmbd-for-next and will
cause a merge conflict.

From there I'll work on the changes to introduce IPPROTO_SMBDIRECT,
but that needs a bit more work an coordination
with the netdev-next and maybw rdma and io_uring trees, the
work in progress can be found here:
https://git.samba.org/?p=metze/linux/wip.git;a=shortlog;h=refs/heads/master-ipproto-smbdirect

v4: some functions are moved to smbdirect_socket.c
    and got smbdirect_socket_ as prefix.
    add and use smbdirect_{bind,listen,accept}()
    a lot of small fixes here and there...

v3: async connect/accept code was moved to
    workqueue functions instead of beeing
    called in interrupt context via
    IB_POLL_SOFTIRQ.
    Added some includes to smbdirect_socket.h
    I also did a few minor changes like using
    sc->ib.dev consistently.

Stefan Metzmacher (145):
  smb: smbdirect: let smbdirect.h include #include <linux/types.h>
  smb: smbdirect: introduce smbdirect_socket.logging infrastructure
  smb: smbdirect: add some logging to
    SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
  smb: smbdirect: introduce smbdirect_recv_io.complex_work
  smb: smbdirect: introduce smbdirect_all_c_files.c
  smb: smbdirect: introduce smbdirect_internal.h
  smb: client: include smbdirect_all_c_files.c
  smb: server: include smbdirect_all_c_files.c
  smb: smbdirect: introduce smbdirect_socket.c to be filled
  smb: smbdirect: introduce smbdirect_socket_prepare_create()
  smb: smbdirect: introduce smbdirect_socket_set_logging()
  smb: smbdirect: introduce smbdirect_socket_wake_up_all()
  smb: smbdirect: introduce smbdirect_socket_cleanup_work()
  smb: smbdirect: introduce
    smbdirect_socket_schedule_cleanup[{_lvl,_status}]()
  smb: smbdirect: introduce smbdirect_connection.c to be filled
  smb: smbdirect: introduce smbdirect_connection_{get,put}_recv_io()
  smb: smbdirect: introduce
    smbdirect_connection_reassembly_{append,first}_recv_io()
  smb: smbdirect: introduce smbdirect_connection_idle_timer_work()
  smb: smbdirect: set SMBDIRECT_KEEPALIVE_NONE before
    disable_delayed_work(&sc->idle.timer_work);
  smb: smbdirect: introduce smbdirect_frwr_is_supported()
  smb: smbdirect: introduce smbdirect_socket.{send,recv}_io.mem.gfp_mask
  smb: smbdirect: introduce smbdirect_connection_{alloc,free}_send_io()
  smb: smbdirect: introduce smbdirect_connection_send_io_done()
  smb: smbdirect: introduce
    smbdirect_connection_{create,destroy}_mem_pools()
  smb: smbdirect: introduce smbdirect_map_sges_from_iter() and helper
    functions
  smb: smbdirect: introduce smbdirect_connection_qp_event_handler()
  smb: smbdirect: introduce
    smbdirect_connection_negotiate_rdma_resources()
  smb: smbdirect: introduce smbdirect_connection_{create,destroy}_qp()
  smb: smbdirect: introduce smbdirect_connection_post_recv_io()
  smb: smbdirect: introduce smbdirect_connection_recv_io_refill_work()
  smb: smbdirect: split out smbdirect_connection_recv_io_refill()
  smb: smbdirect: introduce smbdirect_get_buf_page_count()
  smb: smbdirect: introduce smbdirect_socket_wait_for_credits()
  smb: smbdirect: introduce smbdirect_mr.c with client mr code
  smb: smbdirect: introduce smbdirect_rw.c with server rw code
  smb: smbdirect: define SMBDIRECT_MIN_{RECEIVE,FRAGMENTED}_SIZE
  smb: smbdirect: define SMBDIRECT_RDMA_CM_[RNR_]RETRY
  smb: smbdirect: introduce smbdirect_connection_recv_io_done()
  smb: smbdirect: introduce smbdirect_socket_destroy[_sync]()
  smb: smbdirect: introduce
    smbdirect_connection_rdma_{established,event_handler}()
  smb: smbdirect: introduce smbdirect_connection_recvmsg()
  smb: smbdirect: introduce smbdirect_connection_grant_recv_credits()
  smb: smbdirect: introduce smbdirect_connection_request_keep_alive()
  smb: smbdirect: introduce smbdirect_connection_send_iter() and related
    functions
  smb: smbdirect: introduce smbdirect_connection_send_immediate_work()
  smb: smbdirect: introduce smbdirect_connection_negotiation_done()
  smb: smbdirect: introduce smbdirect_mr_io_fill_buffer_descriptor()
  smb: smbdirect: introduce
    smbdirect_connection_legacy_debug_proc_show()
  smb: smbdirect: introduce smbdirect_connection_wait_for_connected()
  smb: smbdirect: introduce smbdirect_connection_is_connected()
  smb: smbdirect: introduce smbdirect_socket_shutdown()
  smb: smbdirect: introduce smbdirect_socket_init_{new,accepting}() and
    helpers
  smb: smbdirect: introduce smbdirect_connect[_sync]()
  smb: smbdirect: introduce smbdirect_accept_connect_request()
  smb: smbdirect: introduce smbdirect_socket_create_{kern,accepting}()
    and smbdirect_socket_release()
  smb: smbdirect: let smbdirect_socket.h include all headers for used
    structures
  smb: smbdirect: let smbdirect_internal.h define pr_fmt without
    SMBDIRECT_USE_INLINE_C_FILES
  smb: smbdirect: introduce smbdirect_public.h with prototypes
  smb: smbdirect: provide explicit prototypes for cross .c file
    functions
  smb: smbdirect: introduce the basic smbdirect.ko
  smb: client: make use of smbdirect_socket_prepare_create()
  smb: client: make use of smbdirect_socket_set_logging()
  smb: client: make use of smbdirect_socket_wake_up_all()
  smb: client: let allocate_receive_buffers() initialize complex_work as
    disabled
  smb: client: make use of smbdirect_socket_cleanup_work()
  smb: client: make use of smbdirect_socket_schedule_cleanup()
  smb: client: make use of smbdirect_connection_{get,put}_recv_io()
  smb: client: make use of
    smbdirect_connection_reassembly_{append,first}_recv_io()
  smb: client: make use of smbdirect_connection_idle_timer_work()
  smb: client: make use of smbdirect_frwr_is_supported()
  smb: client: make use of smbdirect_connection_{alloc,free}_send_io()
  smb: client: make use of smbdirect_connection_send_io_done()
  smb: client: make use of
    smbdirect_connection_{create,destroy}_mem_pools()
  smb: client: make use of smbdirect_map_sges_from_iter()
  smb: client: make use of smbdirect_connection_qp_event_handler()
  smb: client: make use of
    smbdirect_connection_negotiate_rdma_resources()
  smb: client: make use of smbdirect_connection_{create,destroy}_qp()
  smb: client: initialize recv_io->cqe.done = recv_done just once
  smb: client: make use of smbdirect_connection_post_recv_io()
  smb: client: make use of smbdirect_connection_recv_io_refill_work()
  smb: client: make use of functions from smbdirect_mr.c
  smb: client: make use of smbdirect_socket_destroy_sync()
  smb: client: make use of smbdirect_connection_recvmsg()
  smb: client: let smbd_post_send() make use of request->wr
  smb: client: make use of smbdirect_connection_grant_recv_credits()
  smb: client: make use of smbdirect_connection_request_keep_alive()
  smb: client: change smbd_post_send_empty() to void return
  smb: client: let smbd_post_send_iter() get remaining_length and return
    data_length
  smb: client: let smbd_post_send_full_iter() get remaining_length and
    return data_length
  smb: client: make use of
    smbdirect_connection_send_{single_iter,immediate_work}()
  smb: client: introduce and use smbd_mr_fill_buffer_descriptor()
  smb: client: introduce and use smbd_debug_proc_show()
  smb: client: make use of smbdirect_socket_init_new() and
    smbdirect_connect_sync()
  smb: client: make use of
    smbdirect_socket_create_kern()/smbdirect_socket_release()
  smb: client: only use public smbdirect functions
  smb: client: make use of smbdirect.ko
  smb: server: make use of smbdirect_socket_prepare_create()
  smb: server: make use of smbdirect_socket_set_logging()
  smb: server: make use of smbdirect_socket_wake_up_all()
  smb: server: let smb_direct_create_pools() initialize complex_work as
    disabled
  smb: server: make use of smbdirect_socket_cleanup_work()
  smb: server: make use of smbdirect_socket_schedule_cleanup()
  smb: server: make use of smbdirect_connection_{get,put}_recv_io()
  smb: server: make use of
    smbdirect_connection_reassembly_{append,first}_recv_io()
  smb: server: make use of smbdirect_connection_idle_timer_work()
  smb: server: make use of smbdirect_frwr_is_supported()
  smb: server: make use of smbdirect_connection_{alloc,free}_send_io()
  smb: server: make use of smbdirect_connection_send_io_done()
  smb: server: make use of
    smbdirect_connection_{create,destroy}_mem_pools()
  smb: server: make use of smbdirect_map_sges_from_iter()
  smb: server: make use of smbdirect_connection_qp_event_handler()
  smb: server: make use of
    smbdirect_connection_negotiate_rdma_resources()
  smb: server: make use of smbdirect_connection_{create,destroy}_qp()
  smb: server: initialize recv_io->cqe.done = recv_done just once
  smb: server: make use of smbdirect_connection_post_recv_io()
  smb: server: make use of smbdirect_connection_recv_io_refill[_work]()
  smb: server: make use of smbdirect_get_buf_page_count()
  smb: server: make use of smbdirect_socket_wait_for_credits()
  smb: server: make use of functions from smbdirect_rw.c
  smb: server: make use of smbdirect_socket_destroy_sync()
  smb: server: make use of smbdirect_connection_recvmsg()
  smb: server: make use of smbdirect_connection_grant_recv_credits()
  smb: server: make use of smbdirect_connection_request_keep_alive()
  smb: server: move iov_iter_kvec() out of smb_direct_post_send_data()
  smb: server: inline smb_direct_create_header() into
    smb_direct_post_send_data()
  smb: server: let smbdirect_map_sges_from_iter() truncate the message
    boundary
  smb: server: split out smb_direct_send_iter() out of
    smb_direct_writev()
  smb: server: let smb_direct_post_send_data() return data_length
  smb: server: make use of smbdirect_connection_send_iter() and related
    functions
  smb: server: make use of
    smbdirect_{socket_init_accepting,connection_wait_for_connected}()
  smb: server: make use of
    smbdirect_socket_create_accepting()/smbdirect_socket_release()
  smb: server: only use public smbdirect functions
  smb: server: make use of smbdirect.ko
  smb: smbdirect: wrap rdma_disconnect() in rdma_[un]lock_handler()
  smb: smbdirect: remove unused
    smbdirect_connection_mr_io_recovery_work()
  smb: smbdirect: prepare use of dedicated workqueues for different
    steps
  smb: smbdirect: introduce global workqueues
  smb: client: no longer use smbdirect_socket_set_custom_workqueue()
  smb: server: no longer use smbdirect_socket_set_custom_workqueue()
  smb: smbdirect: split out smbdirect_accept_negotiate_finish()
  smb: smbdirect: introduce smbdirect_socket_bind()
  smb: smbdirect: introduce smbdirect_socket_{listen,accept}()
  smb: server: make use of smbdirect_socket_{listen,accept}()
  smb: server: remove unused ksmbd_transport_ops.prepare()
  smb: smbdirect: remove unused SMBDIRECT_USE_INLINE_C_FILES logic

 fs/smb/Kconfig                                |    2 +
 fs/smb/client/Kconfig                         |    3 +-
 fs/smb/client/cifs_debug.c                    |   67 +-
 fs/smb/client/smb2pdu.c                       |    9 +-
 fs/smb/client/smbdirect.c                     | 2802 +----------------
 fs/smb/client/smbdirect.h                     |   18 +-
 fs/smb/common/Makefile                        |    1 +
 fs/smb/common/smbdirect/Kconfig               |    9 +
 fs/smb/common/smbdirect/Makefile              |   17 +
 fs/smb/common/smbdirect/smbdirect.h           |    2 +
 fs/smb/common/smbdirect/smbdirect_accept.c    |  786 +++++
 fs/smb/common/smbdirect/smbdirect_connect.c   |  842 +++++
 .../common/smbdirect/smbdirect_connection.c   | 2035 ++++++++++++
 fs/smb/common/smbdirect/smbdirect_debug.c     |   88 +
 fs/smb/common/smbdirect/smbdirect_internal.h  |  115 +
 fs/smb/common/smbdirect/smbdirect_listen.c    |  284 ++
 fs/smb/common/smbdirect/smbdirect_main.c      |  112 +
 fs/smb/common/smbdirect/smbdirect_mr.c        |  486 +++
 fs/smb/common/smbdirect/smbdirect_pdu.h       |    4 +
 fs/smb/common/smbdirect/smbdirect_public.h    |  125 +
 fs/smb/common/smbdirect/smbdirect_rw.c        |  255 ++
 fs/smb/common/smbdirect/smbdirect_socket.c    |  756 +++++
 fs/smb/common/smbdirect/smbdirect_socket.h    |  311 +-
 fs/smb/server/Kconfig                         |    4 +-
 fs/smb/server/connection.c                    |    5 -
 fs/smb/server/connection.h                    |    1 -
 fs/smb/server/smb2pdu.c                       |    1 -
 fs/smb/server/transport_rdma.c                | 2659 ++--------------
 fs/smb/server/transport_rdma.h                |    4 +-
 29 files changed, 6633 insertions(+), 5170 deletions(-)
 create mode 100644 fs/smb/common/smbdirect/Kconfig
 create mode 100644 fs/smb/common/smbdirect/Makefile
 create mode 100644 fs/smb/common/smbdirect/smbdirect_accept.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_connect.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_connection.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_debug.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_internal.h
 create mode 100644 fs/smb/common/smbdirect/smbdirect_listen.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_main.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_mr.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_public.h
 create mode 100644 fs/smb/common/smbdirect/smbdirect_rw.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_socket.c

-- 
2.43.0


