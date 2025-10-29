Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B6C1AA15
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gFx1WV+b+1pjrdhef/BZYh7gYM0Xr2U53PWZ8i+Ahc4=; b=VVLgJA3L3/U9fc9dDXKVmdV9kK
	lInRRkJm7HZ/on/Nah6ab7kWb55G1xe9EtVWakiOMtjoZHFYiNWRosXRIFJS4VjwPJhAPwDUo+LLw
	OrPAPOrXo1/BT7bUkXjP2mkKvN50VJg1zBq+tKEyA+lREdw7faQdtyPglqC3R1YUTWT0MjGeliV/6
	T3YQrTh6n3vlF5DObBqxNKAPDe5QWt17kOr7oDivQHP9JPkPQD71rB1uY9vDjfpZNYSIqw8sS3eXK
	0lAXQ56Zl7c+BJJtVuQRXe83Pty2EBxahcCKtF28LBOYNfnJBr8mdSGuXZGK2Roa1J5pQW0W0RLkg
	mLb5xjXA==;
Received: from ip6-localhost ([::1]:26456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE68M-0095CP-Rg; Wed, 29 Oct 2025 13:22:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47002) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68H-0095CI-9s
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=gFx1WV+b+1pjrdhef/BZYh7gYM0Xr2U53PWZ8i+Ahc4=; b=0NgBFagyneMH0MuAgOtW0YdM6M
 c/tmuawsbAWnuo6+r8voXBVc0NG2NJHKI/OJllXgPTMQSVjmSlTsPOKokoiGLVPp0l2yv4NDEPbSJ
 MjTQ+CFH74t1ScTvAHeqTByUnwCsY2KnVS5QDUHI9StZbD1zH3GtayYWhLXIzJ4mVts/YY4VdoUTX
 +8l6Tcyq0BqdE5tU6cI+5bp9zUp9pceOEEz4Zbdnwj4sldvzMFGiATMWxGIs4f+Bbo40m41loFKjA
 wF7RmzN7pLrTjlrm5xYGDGpAVmRNTScZqFAUBrkvWGlb2d9DtJ9JksbpDnBpoaSlXVi1/Ui016jH7
 G/4+BSp4415J0rDRKthsuH7CV+fafzS2fJz+5agW/uiXT3meOjn+v3hegWtCM1oLqFYlC+bWmnump
 LfzJc52GK3M4RLTznUExi74HIg8x/MXSsaQgsgTeFqPQK2Mr2LLMJuHLhI7gjVpxRGewTL4TJXGDo
 gIO3bDYCOW6nborFwyoY5TKd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68F-00BbEB-2T; Wed, 29 Oct 2025 13:22:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 000/127] smb: smbdirect/client/server: moving to common
 functions and smbdirect.ko
Date: Wed, 29 Oct 2025 14:19:38 +0100
Message-ID: <cover.1761742839.git.metze@samba.org>
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
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is the move use common functions in an smbdirect.ko.

It can also be found in my for-6.19/fs-smb-20251029-v2 branch,
at commit ca69115a279fbe0455c1b48d283072520e257d45:
git fetch https://git.samba.org/metze/linux/wip.git for-6.19/fs-smb-20251029-v2
https://git.samba.org/?p=metze/linux/wip.git;a=shortlog;h=refs/heads/for-6.19/fs-smb-20251029-v2

It is based on origin/master and smfrench-smb3-kernel/ksmbd-for-next
at commit e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6

Plus the patches from
https://lore.kernel.org/linux-cifs/20251027065102.12104-1-linkinjeon@kernel.org/
ksmbd: detect RDMA capable lower devices when bridge and vlan netdev is used
ksmbd: detect RDMA capable netdevs include IPoIB

and

https://lore.kernel.org/linux-cifs/20251028174347.1800568-1-metze@samba.org/
smb: client: call smbd_destroy() in the same splace as
kernel_sock_shutdown()/sock_release()

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

Can we get this into for-next-next?

David, if you rebase on this, you should be able to use
smbdirect_connection_send_iter() directly in smbd_send() and
remove the iov_iter_advance(iter, 4); before calling smbd_send().
smb_extract_bvecq_to_rdma() should be added as
smbdirect_map_sges_from_bvecq() into smbdirect_map_sges_from_iter().

From there I'll work on the changes to introduce IPPROTO_SMBDIRECT.

Stefan Metzmacher (127):
  smb: smbdirect: let smbdirect.h include #include <linux/types.h>
  smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
  smb: smbdirect: introduce smbdirect_socket.logging infrastructure
  smb: smbdirect: introduce smbdirect_all_c_files.c
  smb: smbdirect: introduce smbdirect_internal.h
  smb: client: include smbdirect_all_c_files.c
  smb: server: include smbdirect_all_c_files.c
  smb: smbdirect: introduce smbdirect_connection.c with the first helper
    function
  smb: smbdirect: introduce smbdirect_socket_set_logging()
  smb: smbdirect: introduce smbd_disconnect_wake_up_all()
  smb: smbdirect: introduce smbdirect_connection_disconnect_work()
  smb: smbdirect: introduce smbdirect_connection_schedule_disconnect()
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
  smb: smbdirect: introduce smbdirect_connection_wait_for_credits()
  smb: smbdirect: introduce smbdirect_mr.c with client mr code
  smb: smbdirect: introduce smbdirect_rw.c with server rw code
  smb: smbdirect: define SMBDIRECT_MIN_{RECEIVE,FRAGMENTED}_SIZE
  smb: smbdirect: define SMBDIRECT_RDMA_CM_[RNR_]RETRY
  smb: smbdirect: introduce smbdirect_connection_recv_io_done()
  smb: smbdirect: introduce smbdirect_connection_destroy[_sync]()
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
  smb: smbdirect: let smbdirect_internal.h define pr_fmt without
    SMBDIRECT_USE_INLINE_C_FILES
  smb: smbdirect: introduce smbdirect_public.h with prototypes
  smb: smbdirect: introduce smbdirect_private.h with prototypes
  smb: smbdirect: introduce the basic smbdirect.ko
  smb: client: make use of smbdirect_socket_prepare_create()
  smb: client: make use of smbdirect_socket_set_logging()
  smb: client: make use of smbdirect_connection_wake_up_all()
  smb: client: make use of smbdirect_connection_disconnect_work()
  smb: client: make use of smbdirect_connection_schedule_disconnect()
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
  smb: client: make use of smbdirect_connection_destroy_sync()
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
  smb: server: make use of smbdirect_connection_wake_up_all()
  smb: server: make use of smbdirect_connection_disconnect_work()
  smb: server: make use of smbdirect_connection_schedule_disconnect()
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
  smb: server: make use of smbdirect_connection_wait_for_credits()
  smb: server: make use of functions from smbdirect_rw.c
  smb: server: make use of smbdirect_connection_destroy_sync()
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

 fs/smb/Kconfig                                |    2 +
 fs/smb/client/Kconfig                         |    3 +-
 fs/smb/client/cifs_debug.c                    |   67 +-
 fs/smb/client/smb2pdu.c                       |    9 +-
 fs/smb/client/smbdirect.c                     | 2813 +----------------
 fs/smb/client/smbdirect.h                     |   20 +-
 fs/smb/common/Makefile                        |    1 +
 fs/smb/common/smbdirect/Kconfig               |    9 +
 fs/smb/common/smbdirect/Makefile              |   15 +
 fs/smb/common/smbdirect/smbdirect.h           |    2 +
 fs/smb/common/smbdirect/smbdirect_accept.c    |  596 ++++
 .../common/smbdirect/smbdirect_all_c_files.c  |   23 +
 fs/smb/common/smbdirect/smbdirect_connect.c   |  797 +++++
 .../common/smbdirect/smbdirect_connection.c   | 2631 +++++++++++++++
 fs/smb/common/smbdirect/smbdirect_debug.c     |   89 +
 fs/smb/common/smbdirect/smbdirect_internal.h  |   20 +
 fs/smb/common/smbdirect/smbdirect_main.c      |   24 +
 fs/smb/common/smbdirect/smbdirect_mr.c        |  565 ++++
 fs/smb/common/smbdirect/smbdirect_pdu.h       |    4 +
 fs/smb/common/smbdirect/smbdirect_private.h   |   92 +
 fs/smb/common/smbdirect/smbdirect_public.h    |  154 +
 fs/smb/common/smbdirect/smbdirect_rw.c        |  254 ++
 fs/smb/common/smbdirect/smbdirect_socket.h    |  206 +-
 fs/smb/server/Kconfig                         |    4 +-
 fs/smb/server/smb2pdu.c                       |    1 -
 fs/smb/server/transport_rdma.c                | 2399 +-------------
 fs/smb/server/transport_rdma.h                |    2 +
 27 files changed, 5823 insertions(+), 4979 deletions(-)
 create mode 100644 fs/smb/common/smbdirect/Kconfig
 create mode 100644 fs/smb/common/smbdirect/Makefile
 create mode 100644 fs/smb/common/smbdirect/smbdirect_accept.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_all_c_files.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_connect.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_connection.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_debug.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_internal.h
 create mode 100644 fs/smb/common/smbdirect/smbdirect_main.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_mr.c
 create mode 100644 fs/smb/common/smbdirect/smbdirect_private.h
 create mode 100644 fs/smb/common/smbdirect/smbdirect_public.h
 create mode 100644 fs/smb/common/smbdirect/smbdirect_rw.c

-- 
2.43.0


