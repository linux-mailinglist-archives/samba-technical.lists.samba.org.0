Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F403880E2
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 22:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JZalYClSGmMUQBofweYoC/S3salSCo2mEgdLrBw+GJI=; b=w5KHDm6PP3yAGV0Oj51GwXF0gS
	Ql2wwfxk1jkwyuLP1JIy6W6STBQGcMjJKPvzV69gw/qj8V9pyKERd4rQWpvtisV6BrSSgz4TArTSy
	PtpZ1RxPSeffGtafnn0CRmtLwD5h0515fSXKW3CRbehourO9zdXcS/8iwWmanr8FWpDKH0FZ01d/g
	b2/VJ7qfKhENj8bR9QPF6snVWq6hNpuIE1KYpYJiqvtudwQng5TmnhpCihieXtDF5Eh3TLt2RDzIX
	l+xdeDwuuszxAGVruv7EZw9fcCUQARpH04GbITD2hUCs0fKg76RTjz2cNAe/R+dSGIwaeVSnHjvL3
	fzfYUbAA==;
Received: from ip6-localhost ([::1]:53356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lj5s6-001XBT-SF; Tue, 18 May 2021 19:59:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj5rz-001XBJ-6Y
 for samba-technical@lists.samba.org; Tue, 18 May 2021 19:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=JZalYClSGmMUQBofweYoC/S3salSCo2mEgdLrBw+GJI=; b=BAYRFLxueO7RMBL5d+AZ0zWDQG
 FkZASDFniAYjpWLS/WBc/KqPA4XKd7P/TCf5qKYyicTQIyb4ykyNtwaYusIJns2Ft1ze5wGE+Srv1
 TvRvaPqSkLQqlEUk2X5lAQ6pmb8SALlQ9RFZ40GqLWn8e1yxI2TYRp1aQAVa3bPazLqK+c9t5rCTU
 JGXiN5OfAQTiCwf/+Hehzijoq5ZjPLkHRELbV41ZZ2Z7g5vVLl4tuHjwObGfKdhIuVX3nLLq0bh1t
 NYYKfGH08qjU2G/cNNE/Eqk41c58nhRmJ5WPt7fblOIWkuxG/OrxPmBT2E6Nkw3wBW6gAablRPrzK
 yjUyrD2oirlGivi6h/ljnloEhtQ7kk2qFtBvm9WlybOdBvnuAhur/kM/cQoO6rMudTiNkpdQaNbmk
 g5ljCs64BUAR+0zEdYpOfskg3LevO7TdFeh5Mthx2eV1/7zwfUaSXoImifN09oG027h3tHQnC7v49
 9SMtUm0VkWM4ytrGzX2PZxj1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj5rx-00006q-FW; Tue, 18 May 2021 19:59:10 +0000
Message-ID: <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 samba-technical@lists.samba.org
Date: Wed, 19 May 2021 07:59:03 +1200
In-Reply-To: <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-05-18 at 17:19 +0200, Dr. Hansjörg Maurer via samba-
technical wrote:
> Hi Andrew
> 
> Am 18.05.21 um 05:15 schrieb Andrew Bartlett:
> 
> > Ouch.  This isn't good.
> > 
> > While of course you could locally patch to increase the limit,
> yes, tried increasing it and this works
> >   I'm
> > really not sure what to do here, because the way the NDR tokens are
> > handled, some of the behaviour is N^2, so large numbers are a
> > really
> > bad idea.
> > 
> > Can you attach a debugger and break on that line?  (It might take
> > some
> > trial/error to find the right process).  It would be helpful to
> > know
> > exactly which structure can't be parsed.  If it is this one from
> > winbind.idl:
> >       NTSTATUS wbint_QueryGroupList(
> > 	[out] wbint_Principals *groups
> > 	);
> here are the last two gdb cycles of
> gdb --args /usr/sbin/winbindd --foreground --no-process-group -S
>   with an breakpoint at
> break librpc/ndr/ndr.c:1089
>          ret = ndr_token_store(ndr, &ndr->array_size_list, p, size);
> 
> until the error occurs (cont 65533)
> 
> 

Can I get a full backtrace 'bt full' when it happens?

> 
> ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
> p=p@entry=0x7fffdca09f78) at ../../librpc/ndr/ndr.c:1090
> 1090            if (ret == NDR_ERR_RANGE) {
> (gdb)
> ndr_pull_wbint_Principal (ndr=ndr@entry=0x5555558cf020, 
> ndr_flags=ndr_flags@entry=512, r=0x7fffdca09f30)
>      at librpc/gen_ndr/ndr_winbind.c:566
> 566                             NDR_CHECK(ndr_pull_array_size(ndr, 
> &r->name));
> (gdb) cont
> Continuing.
> 
> Breakpoint 1, ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
> p=p@entry=0x7fffdca09fc8)
>      at ../../librpc/ndr/ndr.c:1089
> 1089            ret = ndr_token_store(ndr, &ndr->array_size_list, p,
> size);
> (gdb) step
> ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
> list=list@entry=0x5555558cf068,
>      key=key@entry=0x7fffdca09fc8, value=31) at
> ../../librpc/ndr/ndr.c:979
> 979     {
> (gdb)
> 980             if (list->tokens == NULL) {
> (gdb)
> 987                     uint32_t alloc_count = 
> talloc_array_length(list->tokens);
> (gdb)
> talloc_get_size (context=0x5555573f97b0) at
> ../../lib/talloc/talloc.c:2821
> 2821    {
> (gdb)
> 2824            if (context == NULL) {
> (gdb)
> 2828            tc = talloc_chunk_from_ptr(context);
> (gdb)
> talloc_get_size (context=0x5555573f97b0) at
> ../../lib/talloc/talloc.c:2830
> 2830            return tc->size;
> (gdb)
> ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
> list=list@entry=0x5555558cf068,
>      key=key@entry=0x7fffdca09fc8, value=31) at
> ../../librpc/ndr/ndr.c:994
> 994                     if (list->count >= NDR_TOKEN_MAX_LIST_SIZE) {
> (gdb)
> 997                     if (list->count == alloc_count) {
> (gdb)
> 1014            list->tokens[list->count].key = key;
> (gdb)
> 1015            list->tokens[list->count].value = value;
> (gdb)
> 1016            list->count++;
> (gdb)
> 1017            return NDR_ERR_SUCCESS;
> (gdb)
> ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
> p=p@entry=0x7fffdca09fc8) at ../../librpc/ndr/ndr.c:1090
> 1090            if (ret == NDR_ERR_RANGE) {
> (gdb)
> ndr_pull_wbint_Principal (ndr=ndr@entry=0x5555558cf020, 
> ndr_flags=ndr_flags@entry=512, r=0x7fffdca09f80)
>      at librpc/gen_ndr/ndr_winbind.c:566
> 566                             NDR_CHECK(ndr_pull_array_size(ndr, 
> &r->name));
> (gdb)
> 567                             NDR_CHECK(ndr_pull_array_length(ndr, 
> &r->name));
> (gdb) cont
> Continuing.

OK, so this case it doesn't happen, which is the one I patched.

> Breakpoint 1, ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
> p=p@entry=0x7fffdca0a018)
>      at ../../librpc/ndr/ndr.c:1089
> 1089            ret = ndr_token_store(ndr, &ndr->array_size_list, p,
> size);
> (gdb) step
> ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
> list=list@entry=0x5555558cf068,
>      key=key@entry=0x7fffdca0a018, value=31) at
> ../../librpc/ndr/ndr.c:979
> 979     {
> (gdb)
> 980             if (list->tokens == NULL) {
> (gdb)
> 987                     uint32_t alloc_count = 
> talloc_array_length(list->tokens);
> (gdb)
> talloc_get_size (context=0x5555573f97b0) at
> ../../lib/talloc/talloc.c:2821
> 2821    {
> (gdb)
> 2824            if (context == NULL) {
> (gdb)
> 2828            tc = talloc_chunk_from_ptr(context);
> (gdb)
> talloc_get_size (context=0x5555573f97b0) at
> ../../lib/talloc/talloc.c:2830
> 2830            return tc->size;
> (gdb)
> ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
> list=list@entry=0x5555558cf068,
>      key=key@entry=0x7fffdca0a018, value=31) at
> ../../librpc/ndr/ndr.c:994
> 994                     if (list->count >= NDR_TOKEN_MAX_LIST_SIZE) {
> (gdb)
> 1017            return NDR_ERR_SUCCESS;
> (gdb)
> ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
> p=p@entry=0x7fffdca0a018) at ../../librpc/ndr/ndr.c:1090
> 1090            if (ret == NDR_ERR_RANGE) {
> (gdb)
> 1091                    return ndr_pull_error(ndr, ret,
> (gdb)
> _ndr_pull_error (ndr=ndr@entry=0x5555558cf020, 
> ndr_err=ndr_err@entry=NDR_ERR_RANGE,
>      function=function@entry=0x7ffff7bcd650 <__FUNCTION__.9556> 
> "ndr_pull_array_size",
>      location=location@entry=0x7ffff7bcc431
> "../../librpc/ndr/ndr.c:1093",
>      format=format@entry=0x7ffff7bcce00 "More than %d NDR tokens
> stored 
> for array_size")
>      at ../../librpc/ndr/ndr.c:606
> 606     {
> (gdb)
> 607             char *s=NULL;

If you can get me the 'bt full' (or even just 'bt') from here, we can
determine which structure was over-full of things needing these
array_size tokens.

> > Then we have more hope of being able to modify the structure to be
> > less
> > resource-consuming.
> > 
> > I wonder if changing to a different string type would
> > help.  Thankfully
> > this isn't a public protocol, so we can be flexible.
> > 
> > Try the attached patch.  It uses an encoding that stores the
> > strings as
> > <num bytes><string> rather than <num bytes><pointer> .... <string>,
> > which needs these 'tokens' to get between the stages.
> the patch did not help,

No worries.  I think I'll propose it anyway, as it just more efficient,
but lets keep looking for where you hit your error.

> Let me know if I should file a bug or can provide additional
> information

A bug would be a good idea regardless, so yes, please file one.

Thanks!

Andrew Bartlett

> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


