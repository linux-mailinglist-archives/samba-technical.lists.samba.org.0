Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD453EE7E9
	for <lists+samba-technical@lfdr.de>; Tue, 17 Aug 2021 10:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=z3HdaRcN40N0eRwMHJZPbnDh/2hYtQy0+yASTncT8CM=; b=20SIY2DTepmUwh0lrfKAhyQdn+
	uhXoBM2GHqAm1AsOM8A6xKGPzOIE6pEzqCfxqiIFeWiQnw8c+N6aa5i2Upe64p5qZGS3v0NE+uo1d
	6w5nGDj1k/d2aw6pVvV4f3UbxTowP2H0rd6pSNBA4cTct39fcNDQHCyfI7Z7Sm2lBcK5rlLbJhYjH
	RhKc1I2gxVSqzZnedhzH90uZZxXv1dPvk+8rkn6yWB3vY6kU/tjrhPhoE9ckAE2jnUJ0AmFPeWmdN
	G44/wGlSf9X+NvOojX1we/fMwTxQqZmZo//H8b3Gssme4NgL4G+E8DFy5B6mQa0ubJUjJ2sZ7FozV
	nWW5Dk4Q==;
Received: from ip6-localhost ([::1]:58138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mFu1T-006nWA-4y; Tue, 17 Aug 2021 08:00:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42429) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mFu1N-006nW0-4n
 for samba-technical@lists.samba.org; Tue, 17 Aug 2021 08:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629187217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=bUqUpteGRfg6CaTNpdZZbSG0wlpBJqDURCWgViSTwp8=;
 b=cGlLk7bnnhomGVWSEJ+Lj27IUrFw+jQRW+TnqE7fCQjqqetWze2DHDxEe4Nn14T3Y8F/lP
 YzJk3YISvPAsAslzClBQbj/LgQDN68G8y0RghTP7r56sV8eosUkBbEfKB/Q1IdKGhiVOlU
 SR9s8GZDPmAzNlnpZsfnShOehW62ZZo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629187217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=bUqUpteGRfg6CaTNpdZZbSG0wlpBJqDURCWgViSTwp8=;
 b=cGlLk7bnnhomGVWSEJ+Lj27IUrFw+jQRW+TnqE7fCQjqqetWze2DHDxEe4Nn14T3Y8F/lP
 YzJk3YISvPAsAslzClBQbj/LgQDN68G8y0RghTP7r56sV8eosUkBbEfKB/Q1IdKGhiVOlU
 SR9s8GZDPmAzNlnpZsfnShOehW62ZZo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-ZZK41tpIOoeSioP_eYih1Q-1; Tue, 17 Aug 2021 04:00:15 -0400
X-MC-Unique: ZZK41tpIOoeSioP_eYih1Q-1
Received: by mail-pl1-f200.google.com with SMTP id
 f9-20020a1709028609b0290128bcba6be7so12691632plo.18
 for <samba-technical@lists.samba.org>; Tue, 17 Aug 2021 01:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bUqUpteGRfg6CaTNpdZZbSG0wlpBJqDURCWgViSTwp8=;
 b=C0y49GY+TdxuNb/2MAxQ9u7SdfMlV3bfckWM/niX9Zv+Zy1DI0lpvOjjqrsapaVlRJ
 aA4kKu8xn0T9K022KtpMz808jyN65IqBolMK85fgTVXzizJZxde80L6qzlFZqcH9u/sC
 wdcVWaOuwlQV2XGDbDEJoQJVMBiOvYyJkpdX1cEJGjSBbvN0h5fnRpAYuEMyUXyjavMT
 scFGQUgoDCcfD4E7t+j+vU8XEaqw12YBcgLk7yb0IHwxX7tLHIzHJwLuFpEhaW9OaEnV
 7FyomxpguvVgUMsclvBp1zRMEOqJOdPIWHHfiiYFXE4WmVoQo64FHQUQJ0fPU7kq/EoS
 LV3g==
X-Gm-Message-State: AOAM532bNP9DTWCdYxPcfZPWhaca0wKI2VFf8i7pHt95CNehYid9UytI
 DQS7VdB9n0jbqKwoWvhnxuIpZXPzixanzGjRMWMXLC6HcOlyge4BCHYwCFISDgs0Mk7jrKvbcl0
 hFwsAO/uNNvQNenKsAPYSseTJdeIKnYmHCgI6WJEhhbDe
X-Received: by 2002:a17:90b:3758:: with SMTP id
 ne24mr2323968pjb.218.1629187213950; 
 Tue, 17 Aug 2021 01:00:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYHvtW57SNo+d3/g9Ilcc1AQsUvWm5rvQ4OlOL53ThJX41h+QR4WVL8yT63DPBIHnZth4Fgzs+bCQODw3kKH0=
X-Received: by 2002:a17:90b:3758:: with SMTP id
 ne24mr2323932pjb.218.1629187213477; 
 Tue, 17 Aug 2021 01:00:13 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 17 Aug 2021 10:00:02 +0200
Message-ID: <CAEcb10tURuNjrFxj5CrMqQVkaSbU3feRnmp+GDD7S7kD+oHnGg@mail.gmail.com>
Subject: Why the communication between winbindd child and DC is not
 asynchronous?
To: samba-technical@lists.samba.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Warn: TLS-SNI hr1.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I have noticed "winbindd: domain child [ADDOMAIN]" is able to start
processing of the next incoming request from the main winbindd only after
the response from the DC is received. This was reproduced in
ad_member_idmap_rid selftest environment via running:

id ADDOMAIN/user1 & id ADDOMAIN/user2 & id ADDOMAIN/user3 &

To make the sequence of events clearly visible, the DC processing is made
slower using 1 sec delay before each incoming request is started - using
gdb breakpoint:

b lsarpc__op_dispatch
commands
shell sleep 1
c
end

The main winbind traces show the all incoming requests (*in:)* are
processed within the first second (07:21:13) and the responses (*out:*) are
coming later ((07:21:14, 07:21:15, 07:21:16):

[2021/08/17 07:21:13.315813,  1, id=3D29, pid=3D1017618, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          in: struct wbint_LookupName
[2021/08/17 07:21:13.321539,  1, id=3D32, pid=3D1017618, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          in: struct wbint_LookupName
[2021/08/17 07:21:13.321942,  1, id=3D33, pid=3D1017618, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          in: struct wbint_LookupName
[2021/08/17 07:21:14.524244,  1, id=3D29, pid=3D1017618, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          out: struct wbint_LookupName
[2021/08/17 07:21:15.555467,  1, id=3D29, pid=3D1017618, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          out: struct wbint_LookupName
[2021/08/17 07:21:16.583586,  1, id=3D29, pid=3D1017618, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          out: struct wbint_LookupName

The traces from child show that the incoming request from main winbindd can
be processed only after the response from DC is delivered:

[2021/08/17 07:21:13.316195,  1, id=3D0, pid=3D1017624, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          in: struct wbint_LookupName
[2021/08/17 07:21:14.523416,  1, id=3D0, pid=3D1017624, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          out: struct wbint_LookupName
[2021/08/17 07:21:14.526129,  1, id=3D0, pid=3D1017624, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          in: struct wbint_LookupName
[2021/08/17 07:21:15.554392,  1, id=3D0, pid=3D1017624, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          out: struct wbint_LookupName
[2021/08/17 07:21:15.556991,  1, id=3D0, pid=3D1017624, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          in: struct wbint_LookupName
[2021/08/17 07:21:16.582744,  1, id=3D0, pid=3D1017624, effective(0, 0),
real(0, 0), class=3Drpc_parse]
../../librpc/ndr/ndr.c:484(ndr_print_function_debug)
          out: struct wbint_LookupName


The reason for this is that we have inner (frame #4) and outer (frame #27)
tevent loop in the winbindd child when it waits for DC to respond. The
outer loop used for processing of incoming requests is blocked till the
inner loop gets the response:

#0  epoll_wait () from /lib64/libc.so.6
#1  epoll_event_loop (epoll_ev=3D0x5619e41014c0, tvalp=3D0x7ffc90bb0ed0) at
glib/tevent/tevent_epoll.c:650
#2  epoll_event_loop_once (ev=3D0x5619e4199940, location=3D0x7f832cdb19e0
"glib/tevent/tevent_req.c:300") at glib/tevent/tevent_epoll.c:937
#3  std_event_loop_once (ev=3D0x5619e4199940, location=3D0x7f832cdb19e0
"glib/tevent/tevent_req.c:300") at glib/tevent/tevent_standard.c:110
#4  _tevent_loop_once (ev=3D0x5619e4199940, location=3D0x7f832cdb19e0
"glib/tevent/tevent_req.c:300") at glib/tevent/tevent.c:790
#5  tevent_req_poll (req=3D0x5619e418c5e0, ev=3D0x5619e4199940) at
glib/tevent/tevent_req.c:300
#6  tevent_req_poll_ntstatus (req=3D0x5619e418c5e0, ev=3D0x5619e4199940,
status=3D0x7ffc90bb1024) at glib/util/tevent_ntstatus.c:109
#7  dcerpc_binding_handle_call (h=3D0x5619e4199730, object=3D0x0,
table=3D0x7f832c0e4340 <ndr_table_lsarpc>, opnum=3D77, r_mem=3D0x5619e411bd=
c0,
r_ptr=3D0x7ffc90bb10d0) at glibrpc/rpc/binding_handle.c:560
#8  dcerpc_lsa_LookupNames4_r (h=3D0x5619e4199730, mem_ctx=3D0x5619e411bdc0=
,
r=3D0x7ffc90bb10d0) at librpc/gen_ndr/ndr_lsa_c.c:13483
#9  dcerpc_lsa_LookupNames4 (h=3D0x5619e4199730, mem_ctx=3D0x5619e411bdc0,
_num_names=3D1, _names=3D0x5619e4199530, _domains=3D0x7ffc90bb11c8,
_sids=3D0x7ffc90bb11a0, _level=3DLSA_LOOKUP_NAMES_DOMAINS_ONLY,
_count=3D0x7ffc90bb119c,
_lookup_options=3DLSA_LOOKUP_OPTION_SEARCH_ISOLATED_NAMES,
_client_revision=3DLSA_CLIENT_REVISION_2, result=3D0x7ffc90bb1280) at
librpc/gen_ndr/ndr_lsa_c.c:13645
#10 dcerpc_lsa_lookup_names_generic (h=3D0x5619e4199730,
mem_ctx=3D0x5619e411bdc0, pol=3D0x7ffc90bb1260, num_names=3D1,
names=3D0x7ffc90bb1310, dom_names=3D0x7ffc90bb1308,
level=3DLSA_LOOKUP_NAMES_DOMAINS_ONLY, sids=3D0x7ffc90bb1320,
types=3D0x7ffc90bb1318, use_lookupnames4=3Dtrue, presult=3D0x7ffc90bb1280) =
at
gsource3/rpc_client/cli_lsarpc.c:588
#11 winbindd_lookup_names (mem_ctx=3D0x5619e411bdc0, domain=3D0x5619e410963=
0,
num_names=3D1, names=3D0x7ffc90bb1310, domains=3D0x7ffc90bb1308,
sids=3D0x7ffc90bb1320, types=3D0x7ffc90bb1318) at
gsource3/winbindd/winbindd_msrpc.c:1021
#12 msrpc_name_to_sid (domain=3D0x5619e4109630, mem_ctx=3D0x5619e411bdc0,
domain_name=3D0x5619e417fa00 "ADDOMAIN", name=3D0x5619e4177330 "BOB5", flag=
s=3D8,
pdom_name=3D0x7ffc90bb1448, sid=3D0x5619e4107520, type=3D0x5619e417a6c0) at
gsource3/winbindd/winbindd_msrpc.c:264
#13 name_to_sid (domain=3D0x5619e4109630, mem_ctx=3D0x5619e411bdc0,
domain_name=3D0x5619e417fa00 "ADDOMAIN", name=3D0x5619e4177330 "BOB5", flag=
s=3D8,
pdom_name=3D0x7ffc90bb1448, sid=3D0x5619e4107520, type=3D0x5619e417a6c0) at
gsource3/winbindd/winbindd_ads.c:569
#14 name_to_sid (domain=3D0x5619e4109630, mem_ctx=3D0x5619e411bdc0,
domain_name=3D0x5619e417fa00 "ADDOMAIN", name=3D0x5619e4177330 "BOB5", flag=
s=3D8,
pdom_name=3D0x7ffc90bb1448, sid=3D0x5619e4107520, type=3D0x5619e417a6c0) at
gsource3/winbindd/winbindd_reconnect_ads.c:146
#15 wb_cache_name_to_sid (domain=3D0x5619e4109630, mem_ctx=3D0x5619e411bdc0=
,
domain_name=3D0x5619e417fa00 "ADDOMAIN", name=3D0x5619e4177330 "BOB5", flag=
s=3D8,
sid=3D0x5619e4107520, type=3D0x5619e417a6c0) at
gsource3/winbindd/winbindd_cache.c:1803
#16 _wbint_LookupName (p=3D0x5619e4119f50, r=3D0x5619e411c7a0) at
gsource3/winbindd/winbindd_dual_srv.c:142
#17 winbind__op_dispatch_internal (dce_call=3D0x5619e411bdc0,
mem_ctx=3D0x5619e411bdc0, r=3D0x5619e411c7a0,
dispatch=3DS3COMPAT_RPC_DISPATCH_INTERNAL) at
./librpc/gen_ndr/ndr_winbind_scompat.c:186
#18 winbind__op_local (dce_call=3D0x5619e411bdc0, mem_ctx=3D0x5619e411bdc0,
r=3D0x5619e411c7a0) at ./librpc/gen_ndr/ndr_winbind_scompat.c:876
#19 dcesrv_call_dispatch_local (call=3D0x5619e411bdc0) at
glibrpc/rpc/dcesrv_core.c:2983
#20 winbindd_dual_ndrcmd (domain=3D0x5619e4109630, state=3D0x7ffc90bb3108) =
at
gsource3/winbindd/winbindd_dual_ndr.c:553
#21 child_process_request (child=3D0x5619e4109890, state=3D0x7ffc90bb3108) =
at
gsource3/winbindd/winbindd_dual.c:791
#22 child_handler (ev=3D0x5619e40e73b0, fde=3D0x5619e411c580, flags=3D1,
private_data=3D0x7ffc90bb3100) at gsource3/winbindd/winbindd_dual.c:1669
#23 tevent_common_invoke_fd_handler (fde=3D0x5619e411c580, flags=3D1,
removed=3D0x0) at glib/tevent/tevent_fd.c:142
#24 epoll_event_loop (epoll_ev=3D0x5619e4109410, tvalp=3D0x7ffc90bb1820) at
glib/tevent/tevent_epoll.c:736
#25 epoll_event_loop_once (ev=3D0x5619e40e73b0, location=3D0x5619e3a3ffb8
"gsource3/winbindd/winbindd_dual.c:1896") at glib/tevent/tevent_epoll.c:937
#26 std_event_loop_once (ev=3D0x5619e40e73b0, location=3D0x5619e3a3ffb8
"gsource3/winbindd/winbindd_dual.c:1896") at
glib/tevent/tevent_standard.c:110
#27 _tevent_loop_once (ev=3D0x5619e40e73b0, location=3D0x5619e3a3ffb8
"gsource3/winbindd/winbindd_dual.c:1896") at glib/tevent/tevent.c:790
#28 fork_domain_child (child=3D0x5619e4109890) at
gsource3/winbindd/winbindd_dual.c:1896
#29 wb_child_request_waited (subreq=3D0x0) at
gsource3/winbindd/winbindd_dual.c:271
#30 _tevent_req_notify_callback (req=3D0x5619e411cac0,
location=3D0x7f832cdb1790 "glib/tevent/tevent_queue.c:355") at
glib/tevent/tevent_req.c:141
#31 tevent_req_finish (req=3D0x5619e411cac0, state=3DTEVENT_REQ_DONE,
location=3D0x7f832cdb1790 "glib/tevent/tevent_queue.c:355") at
glib/tevent/tevent_req.c:193
#32 _tevent_req_done (req=3D0x5619e411cac0, location=3D0x7f832cdb1790
"glib/tevent/tevent_queue.c:355") at glib/tevent/tevent_req.c:199
#33 tevent_queue_wait_trigger (req=3D0x5619e411cac0, private_data=3D0x0) at
glib/tevent/tevent_queue.c:355
#34 tevent_queue_immediate_trigger (ev=3D0x5619e40e73b0, im=3D0x5619e410a32=
0,
private_data=3D0x5619e410a280) at glib/tevent/tevent_queue.c:149
#35 tevent_common_invoke_immediate_handler (im=3D0x5619e410a320, removed=3D=
0x0)
at glib/tevent/tevent_immediate.c:190
#36 tevent_common_loop_immediate (ev=3D0x5619e40e73b0) at
glib/tevent/tevent_immediate.c:236
#37 epoll_event_loop_once (ev=3D0x5619e40e73b0, location=3D0x5619e3a13900
"gsource3/winbindd/winbindd.c:2030") at glib/tevent/tevent_epoll.c:918
#38 std_event_loop_once (ev=3D0x5619e40e73b0, location=3D0x5619e3a13900
"gsource3/winbindd/winbindd.c:2030") at glib/tevent/tevent_standard.c:110
#39 _tevent_loop_once (ev=3D0x5619e40e73b0, location=3D0x5619e3a13900
"gsource3/winbindd/winbindd.c:2030") at glib/tevent/tevent.c:790
#40 main (argc=3D7, argv=3D0x7ffc90bb3868) at gsource3/winbindd/winbindd.c:=
2030


I assume that this is an unwanted situation, since the purpose of tevent
library is to achieve asynchronous communication, or? Can we get rid of the
inner tevent loop which starts in dcerpc_binding_handle_call()? I am
wondering what is this TODO comment (from commit 4030bc9b) about:

528 NTSTATUS dcerpc_binding_handle_call(struct dcerpc_binding_handle *h,

...
541 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7/ * TODO: allow only on=
e sync call




Pavel
