Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708F1BC79F
	for <lists+samba-technical@lfdr.de>; Tue, 28 Apr 2020 20:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gKHxx/OF7TV5LW8Y1uNx08VGCakHS3g23AvB4fTARhQ=; b=nhmYZKlqNOMGBJOGYfwxJf7Eb0
	tWdlE8V9GxcFxxeUT/HmIM6nHTupbXPNTSKdMfilZviiS+AMbsKFAN73ak1c/fgELPgr65j/GGMsR
	NoiS8/dsqVp/rqJL+WY8o1mrZqNFDen0jEPH8cJJ3bWP6ttM+wkEmLoOQV2qZschJwRHX5sNVOb1k
	AgQ4QgO713NLH195Tl0MFLV/7BrFgz83pF7mfm3AUT+6Mx5QditwF+EeMq4qFskfBmlpwV63Nb1ri
	VW23wFSMfCcze9+bsXy6Y0Dzvh0YXGo5bL7Vfs8jzsiln0dzomq/j2ZXoZFGXj4e2/T0Yxw1W5Btb
	K4XeG4qA==;
Received: from localhost ([::1]:65270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jTUl2-002MDJ-Sl; Tue, 28 Apr 2020 18:15:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33452) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTUkw-002MDA-Af
 for samba-technical@lists.samba.org; Tue, 28 Apr 2020 18:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gKHxx/OF7TV5LW8Y1uNx08VGCakHS3g23AvB4fTARhQ=; b=ZA4nITQNZYbeed401+6nGF5MiX
 s+2qViRY3Vy2B2GPVtX07BG5DRSyoyXiLjZHd7L2xlRBa3oBGTkjiZFTy+wXOfAT7Cn82WcTgzWYa
 Q9UcWdg4nJwv65JA9nbxayLNfs29DgBXn+PvLdqdaAZWEP0cBheS9t/QmsYp8SVpv262UvOthfVG/
 NIvtsOyoq8wXmBaX2Emx8p0tQ9A1/wBPJOoW3QUsXcK/zOfh7hGeBLYAYHjVOc3GwOUXDXrLHtlly
 ruPbcDCZrqGsf7k5nik5cPP0rfS8QxRpHH2CEENZz60k2UfDbJYQdU4ZKglJolSrOnLB5jge01c3M
 mN9XKc79oeKkTtxDE7L03PZN813AF9yuNYFfNv5QkfLvioG1GDe3hVqzIRK+lre213vV3rqJ4Rgaj
 pg6PEsOd4yyfOfnVkbVRUgtDVtt8EFAotAtqK3sTUcvuf/8ox1zzAEsWPO5WfYYq0KWMHnQXyU7K/
 krz5KOET4DrLmF1CTNVVWKm2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTUkt-0007Zq-KC; Tue, 28 Apr 2020 18:14:52 +0000
Date: Tue, 28 Apr 2020 11:14:41 -0700
To: Alexander Bokovoy <ab@samba.org>
Subject: Re: RPC handles cannot be differentiated in source3 RPC server
Message-ID: <20200428181441.GI14581@jeremy-acer>
References: <20200428143131.GE2735275@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428143131.GE2735275@onega.vda.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: metze@samba.org, asn@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 28, 2020 at 05:31:31PM +0300, Alexander Bokovoy wrote:
> I started looking where this 'first bit must be null' comes from and
> after few refactorings I got down to the commit Jeremy did in 1998 while
> merging NTDOM branch server code:
> 
> commit fdeea341ed1bae670382e45eb731db1b5838ad21
> Author: Jeremy Allison <jra@samba.org>
> Date:   Wed Mar 11 21:11:04 1998 +0000
> 
>     "For I have laboured mightily on Luke's code, and hath broken
>     all I saw" - the book of Jeremy, chapter 1 :-).
> 
>     So here is the mega-merge of the NTDOM branch server code.
>     It doesn't include the new client side pieces, we'll look
>     at that later.
> 
>     ....
> 
> In source4 DCE RPC server code we have dcesrv_handle_create() which
> allows to pass the handle type explicitly. Indeed, there
> dcesrv_lsa_OpenTrustedDomain_common() does explictly call
> dcesrv_handle_create() with the correct handle type:
> 
>         handle = dcesrv_handle_create(dce_call, LSA_HANDLE_TRUSTED_DOMAIN);
> 
> 
> The fix would be pretty obvious: update create_policy_hnd() and its
> internal implementation to pass-through the handle type. This should not
> affect many places:
> 
> $ git grep create_policy_hnd
> source3/rpc_server/epmapper/srv_epmapper.c:             ok = create_policy_hnd(p, r->out.entry_handle, eps);
> source3/rpc_server/epmapper/srv_epmapper.c:             ok = create_policy_hnd(p, r->out.entry_handle, eps);
> source3/rpc_server/eventlog/srv_eventlog_nt.c:  if ( !create_policy_hnd( p, hnd, elog ) ) {
> source3/rpc_server/lsa/srv_lsa_nt.c:    if (!create_policy_hnd(p, handle, info)) {
> source3/rpc_server/mdssvc/srv_mdssvc_nt.c:      if (!create_policy_hnd(p, handle, mds_ctx)) {
> source3/rpc_server/rpc_handles.c:  If "data_ptr" is given, this must be a talloc'ed object, create_policy_hnd
> source3/rpc_server/rpc_handles.c:               DEBUG(0,("create_policy_hnd: ERROR: too many handles (%d) on this pipe.\n",
> source3/rpc_server/rpc_handles.c:               DEBUG(0,("create_policy_hnd: ERROR: out of memory!\n"));
> source3/rpc_server/rpc_handles.c:bool create_policy_hnd(struct pipes_struct *p, struct policy_handle *hnd,
> source3/rpc_server/rpc_pipes.h:bool create_policy_hnd(struct pipes_struct *p, struct policy_handle *hnd, void *data_ptr);
> source3/rpc_server/spoolss/srv_spoolss_nt.c:    if (!create_policy_hnd(p, hnd, new_printer)) {
> source3/rpc_server/svcctl/srv_svcctl_nt.c:      if ( !create_policy_hnd( p, handle, info ) ) {
> source3/rpc_server/winreg/srv_winreg_nt.c:      if ( !create_policy_hnd( p, hnd, key ) ) {
> source3/rpc_server/winreg/srv_winreg_nt.c:      if (!create_policy_hnd(p, r->out.new_handle, new_key)) {
> 
> Anyone has anything against this change?

Thanks a *LOT* for the deep dive Alexander. Much appreciated
cleaning up my old mistakes (of which I'm sure there are many
more to find :-).

Put in an MR and I'll review !

Jeremy.

