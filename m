Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A1E4714D5
	for <lists+samba-technical@lfdr.de>; Sat, 11 Dec 2021 18:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Lce7oFuJPBs1Mb0IkGg7zuxqHE8DOVLVH92aoIecwpo=; b=bUrJbfQkV4/qVwRD9h2UwwpVQX
	jgDJaSdJl8KAly7TNQ10AsTYoXvb87v4XhMR91j67Q3kUCe9L7rEnefLhnTShKV8BbYyNL7AnaBbR
	nslpGwH54f4kSPnD5zlwoG3pf4/0Cqwbuc4hNfhsT0wGkNhBv/Nrxc97RConIeXq3r61DoCqXNJbu
	aRBqskoO4Q4CbxZ7EoRGRjcZsNqMtW+r6CFXYoIJ/ANTtgl77sN2pDWaW4S7H6t/6UyeY66At7kr4
	SUk0z5YGTrC4v0JRk65FCeAgcVGJqA/jJSxTa/1KcqsByU71EtXcOG77jvsNaCTBIrq7EoL4z0Ge2
	/TqVAguA==;
Received: from ip6-localhost ([::1]:22490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mw5k4-005GCI-J1; Sat, 11 Dec 2021 17:01:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mw5jz-005GC9-58
 for samba-technical@lists.samba.org; Sat, 11 Dec 2021 17:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Lce7oFuJPBs1Mb0IkGg7zuxqHE8DOVLVH92aoIecwpo=; b=q41k/BjZKV3mEk745yMuxrvGZW
 pJfK99Ow5CfRzV9n2ss02NYCxBOfcKkTGfYRHQ+czmH/J7IgWFDkmDWsmPvJRaX/aj15UNi4fgoja
 mKGJekLOcM/sw9KLREKzWrrBj/sbeZ2jvzW3D9e+W5py95FPYdEK5OaAaSw0/uMDEOyxyd7XIfzQJ
 o3KadTTL3BZMDLaBSHYK58i5ukGnyk8idPqfZRU5t00tFQb8ZIPxZEeItu4X3YexTMILnwvIezGTu
 HDQ56qjarxxeYpZOXXN74xvcwjupi8TKp4Ogl4pHqLhStLOczZlBo9rB7rmERgi1a6QB+C0e4Xxgy
 nE9vBi6rx3PrJsSxgWCFpgtCRk9ht6eKlYC2HlLt1CwZHW/QYU4kJw79aEKZjP1EbsXYw62DbRKsK
 jZrO22gopbsxDrrPXIuLLA9PCA8+ZkRbSnHX0nHhxdyevLTTdL/MutMhicW/qi7EEOK4iVgkonqvu
 +fmAN9+fkILEkqsJNVP+vDe/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mw5jw-002L8K-2b; Sat, 11 Dec 2021 17:00:52 +0000
To: vl@samba.org, samba-technical@lists.samba.org
Subject: Re: samba-dcerpcd
Date: Sat, 11 Dec 2021 18:00:51 +0100
Message-ID: <2575910.vuYhMxLoTh@krikkit>
In-Reply-To: <YbNsXUpMw/k4oJBI@pinega.vda.li>
References: <E1mvhGg-00H6Ho-3p@hrx0.samba.org> <YbNsXUpMw/k4oJBI@pinega.vda.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 10 December 2021 16:03:57 CET Alexander Bokovoy via samba-technical 
wrote:
> On pe, 10 joulu 2021, Volker Lendecke wrote:
> > The branch, master has been updated
> > 
> >        via  ea2ec7ea5e8 WHATSNEW. Added section about samba-dcerpcd.
> >        via  7b62fa967d0 dcesrv_core: Remove unused dcesrv_reinit_context()
> >        via  730f7dfd615 s3:rpc_server: Delete unused code and doc
> >        references
> >        via  9e3ee8c40c0 printing: Remove "start_daemons" from
> >        printing_subsystem_init() via  a7c65958a15 s3:rpc_server: Activate
> >        samba-dcerpcd
> >        via  d522a8cce12 s3:rpc_server: Add samba-dcerpcd helper programs
> >        via  3fb2fd49445 s3:winbind: Close internal RPC pipes after 5 idle
> >        seconds
> >        via  a350a000f10 s3:rpc_server: Make npa_state_init() public
> >        via  a0075a1fd0e unittest: Remove test_sambafs_srv_pipe
> >        via  c2b8cf05c37 s3:printing: Move pcap_cache_loaded() to load.c
> >        via  3aee4c171c2 smbcontrol: Add rpc-dump-status
> >        via  188586dddde s3:rpc_client: Add rpc_pipe_open_local_np()
> >        via  d3e1ece1a45 s3:rpc_server: Implement the rpcd_* helper-end of
> >        the samba-dcerpc protocol via  4d75f08fd22 s3:rpc_client: Add
> >        local_np_connect()
> >        via  3ca7c640da0 s3:rpc_server: Add samba-dcerpcd
> >        via  8ffeb18b9a1 docs-xml: Add "rpc start on demand helpers", true
> >        by default. via  a697814eba9 idl: Define messages sent between
> >        samba-dcerpcd and rpcd's via  da90c02b168 dcesrv_core: Add
> >        dcesrv_loop_next_packet()
> >        via  95659031e45 backupkey.idl: Don't listen on \pipe tsvcs
> >        via  3284ee9985d dcesrv_core: Add dcesrv_context_set_callbacks()
> >        via  ebc3918f7d0 s3:rpc_client: Bump debug level for ncalrpc
> >        connect error
> >        via  f83f7bd6bdd s3:rpc_server: Remove direct registry access from
> >        svcctl_init_winreg via  a60c7b4ff29 s3:services: Disable
> >        rcinit-based service control code via  afd014245a9 test: Prime the
> >        kpasswd server
> >        via  d5fa6263948 rpc_server: Check info5->transport
> >        via  00e41d198d2 librpc: Get transport out of
> >        tstream_npa_accept_existing_recv() via  fa445f15318 auth: Fix a
> >        typo in auth/gensec/ncalrpc.c
> >        via  1bab76223cd librpc: Add named_pipe_auth_req_info5->transport
> >        via  530fb4fdfb3 named_pipe_auth.idl: Add "need_idle_server"
> >        via  d1934e2331f named_pipe_auth: Bump info4 to info5
> >       
> >       from  bd98e040d4a Update WHATSNEW.txt with removal of wildcard copy,
> >       rename and unlink.
> Thank you, Volker! This is a huge step forward for Samba!
> 
> I am going to look at adopting FreeIPA to use samba-dcerpcd during
> Christmas weekend.

That was a huge change and it took quite a while to get it, but this is really 
great work Volker! I hope this brings us one step further to just one dcerpc 
implementation in Samba.

Cheers

	Andreas



