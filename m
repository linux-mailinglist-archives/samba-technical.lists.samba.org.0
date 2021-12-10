Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C2470377
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 16:04:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ao+uef46xJvDRjVuMvwP6aNzvXZDmUU5KN80l4WVzSg=; b=1hAwe/OpD82sYLVVX/e97yeZdx
	JCJ//DgEk3PwEtOrwK7vPaVjgu3AnsOeNVj79MA9NZ4hiMh716hXuruBS6aT4VYSygkWtGhfrV0D9
	ha4JEnj6L22K0jpbTN/MVEm6qHtBbqJw9QvJB/I+JDEtS44Xy/KtZN/9ObL7+815Tzmz6GIYH7UkY
	NdHov8OdufEEVmIlvslaFekgRwH5WA/TAimtOvKMq0DM0/UHKwQAiSkfmKmE4M32mTBjpjwtQwpf7
	FrcqG4uB9vZioYVfxyEhQwlLLCT2dje3Bf0Hz/j9wBkc6r4nz24SBdPBFsC+WO/heyHVFMfgtgiJo
	yBN/aj9w==;
Received: from ip6-localhost ([::1]:27056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvhRN-004wqy-F8; Fri, 10 Dec 2021 15:04:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54418) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvhRI-004wqp-F5
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 15:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=ao+uef46xJvDRjVuMvwP6aNzvXZDmUU5KN80l4WVzSg=; b=ggIdUSn+T7BYaBebPXJabo9pNY
 In6G8bVjOP3auqPFvMJlQmIqGM0j5Jje4fnApt18lVg3iJkUqFussbvggFiTP/fobGLlKoJ/vP9LJ
 jsniZ9yJeQePT4jgFb6F2KXTJuL9nEwtRxRHfE6u6crryylltmqq4LKEem25bnk3goHVGQi1zUpIl
 UWFZu/bD3S9RYWdRu44u7n6VGeH2vL4pf+E6uqA8CQUyqFI9VfJweD0k6vwav0tZuFq6lU9hQ24Wu
 jW8+oBLzIb7AVNVYn6w4yyfqO/DAuhgXU7Bw/n8/6opgrAI5tDpzWJavjQX0LH/3OowLbpHauw2L+
 k0dloVb8T9bWxNR9aUKr3UaRWBV939Tlnu2DyowevtUSzuoqu4oVsG2AGqd6gntffZEXs5UeiTb27
 fBRz8vC/suSfjLRxoXqv1l+8+UUGGj+aDD319f4dPCffQlRGYWw6f5TEE7TY4O29WT5iEhbnDQcD+
 ZGcZSQt9BJI07sK9Hy/Tq+QU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvhRH-002B7g-Hq; Fri, 10 Dec 2021 15:03:59 +0000
Date: Fri, 10 Dec 2021 17:03:57 +0200
To: vl@samba.org, samba-technical@lists.samba.org
Subject: Re: samba-dcerpcd
Message-ID: <YbNsXUpMw/k4oJBI@pinega.vda.li>
References: <E1mvhGg-00H6Ho-3p@hrx0.samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1mvhGg-00H6Ho-3p@hrx0.samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 10 joulu 2021, Volker Lendecke wrote:
> The branch, master has been updated
>        via  ea2ec7ea5e8 WHATSNEW. Added section about samba-dcerpcd.
>        via  7b62fa967d0 dcesrv_core: Remove unused dcesrv_reinit_context()
>        via  730f7dfd615 s3:rpc_server: Delete unused code and doc references
>        via  9e3ee8c40c0 printing: Remove "start_daemons" from printing_subsystem_init()
>        via  a7c65958a15 s3:rpc_server: Activate samba-dcerpcd
>        via  d522a8cce12 s3:rpc_server: Add samba-dcerpcd helper programs
>        via  3fb2fd49445 s3:winbind: Close internal RPC pipes after 5 idle seconds
>        via  a350a000f10 s3:rpc_server: Make npa_state_init() public
>        via  a0075a1fd0e unittest: Remove test_sambafs_srv_pipe
>        via  c2b8cf05c37 s3:printing: Move pcap_cache_loaded() to load.c
>        via  3aee4c171c2 smbcontrol: Add rpc-dump-status
>        via  188586dddde s3:rpc_client: Add rpc_pipe_open_local_np()
>        via  d3e1ece1a45 s3:rpc_server: Implement the rpcd_* helper-end of the samba-dcerpc protocol
>        via  4d75f08fd22 s3:rpc_client: Add local_np_connect()
>        via  3ca7c640da0 s3:rpc_server: Add samba-dcerpcd
>        via  8ffeb18b9a1 docs-xml: Add "rpc start on demand helpers", true by default.
>        via  a697814eba9 idl: Define messages sent between samba-dcerpcd and rpcd's
>        via  da90c02b168 dcesrv_core: Add dcesrv_loop_next_packet()
>        via  95659031e45 backupkey.idl: Don't listen on \pipe tsvcs
>        via  3284ee9985d dcesrv_core: Add dcesrv_context_set_callbacks()
>        via  ebc3918f7d0 s3:rpc_client: Bump debug level for ncalrpc connect error
>        via  f83f7bd6bdd s3:rpc_server: Remove direct registry access from svcctl_init_winreg
>        via  a60c7b4ff29 s3:services: Disable rcinit-based service control code
>        via  afd014245a9 test: Prime the kpasswd server
>        via  d5fa6263948 rpc_server: Check info5->transport
>        via  00e41d198d2 librpc: Get transport out of tstream_npa_accept_existing_recv()
>        via  fa445f15318 auth: Fix a typo in auth/gensec/ncalrpc.c
>        via  1bab76223cd librpc: Add named_pipe_auth_req_info5->transport
>        via  530fb4fdfb3 named_pipe_auth.idl: Add "need_idle_server"
>        via  d1934e2331f named_pipe_auth: Bump info4 to info5
>       from  bd98e040d4a Update WHATSNEW.txt with removal of wildcard copy, rename and unlink.

Thank you, Volker! This is a huge step forward for Samba!

I am going to look at adopting FreeIPA to use samba-dcerpcd during
Christmas weekend.


-- 
/ Alexander Bokovoy

