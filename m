Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C3C387C4F
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 17:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:subject:cc;
	bh=U9oTaodWCXYSfph/bIWPCJVq5Ovk+LtZANfTgxs/HWc=; b=dqfgtbkUJV5bsWdG55znrWp8zf
	G0EmUTxqBS5/bSQtd+Esf8TbE0V5rNKVoNVOQef76Yq8kX8NW5G/GWrBD62xpcfXmDT8EvdkKm0Kl
	OEcmzjJyd1HzHG2iwHDR1A94+D6lGlqZAQtdiKjXXtQCqG1//+qv8UAsp155xC/m01rTtSUImaO4N
	DAQf2N5X6N3K6ac9Y90EJLoh22x8pi2N/U6HL6m/VvpLSGRDJyim6h45nSYWys2rwdU/FiP1j/kxA
	d6QHNJHhjWR9MBKGEgNa5K5CbQNCvTElBcM5A/7ZyZgqfBvD6Nb3Wnt7zh6n7w8mqxnpDSmvxnnF5
	T0k1PUjw==;
Received: from ip6-localhost ([::1]:48692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lj1V2-001Tzf-Sk; Tue, 18 May 2021 15:19:12 +0000
Received: from mail.itsd.de ([80.153.216.99]:38769) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj1Ux-001TzU-6K
 for samba-technical@lists.samba.org; Tue, 18 May 2021 15:19:10 +0000
Received: from mail.itsd.de (mail.itsd.de [192.168.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securemail.itsd.de (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Tue, 18 May 2021 17:19:03 +0200 (CEST)
Received: from nero.itsd.de (unknown [192.168.0.223])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.itsd.de (Postfix) with ESMTPSA id 7B5A1800D6;
 Tue, 18 May 2021 17:19:03 +0200 (CEST)
subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: samba-technical@lists.samba.org
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
Organization: itsystems Deutschland AG
Message-ID: <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
Date: Tue, 18 May 2021 17:19:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=itsd.de; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=lmyZ7cutX
 WVC1Ztl42V96uHvEUFhzoZLcpVcEzzjT20=; b=RbaL8Y7FroCJRQ0YimqmSW1SS
 fJo1JaKACM9KcX5CutFhoHvjrPZKdaZFJk+rie5ei90Y8h1TXrQGmPKF5UN2hDfu
 Cl2eAA0NZvYSFAQ4dFd2cmua6/T6LRlMZZKyOY4ZEgpod32igAGWvQXJvCUasikM
 I+7+syD5tZ0M+SwAv9e2YutFS8t9hjgfEAPMy5sD5WcOOL2U6nXbVFWInzBWTbMo
 gL9J8ax3MXdpNSk3hRFzwpKGZyzrTeE6ti5h4qFfSBEuNISLbaMSNWWucETAoR/I
 yWR8TmR7w5J1+OMKMenYnp9jhOhqSwv2r1Ih01ZySq59Ihed+yVA3dfVWIgiA==
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
From: =?utf-8?q?Dr=2E_Hansj=C3=B6rg_Maurer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew

Am 18.05.21 um 05:15 schrieb Andrew Bartlett:

> Ouch.  This isn't good.
>
> While of course you could locally patch to increase the limit,
yes, tried increasing it and this works
>   I'm
> really not sure what to do here, because the way the NDR tokens are
> handled, some of the behaviour is N^2, so large numbers are a really
> bad idea.
>
> Can you attach a debugger and break on that line?  (It might take some
> trial/error to find the right process).  It would be helpful to know
> exactly which structure can't be parsed.  If it is this one from
> winbind.idl:
>       NTSTATUS wbint_QueryGroupList(
> 	[out] wbint_Principals *groups
> 	);
here are the last two gdb cycles of
gdb --args /usr/sbin/winbindd --foreground --no-process-group -S
  with an breakpoint at
break librpc/ndr/ndr.c:1089
         ret = ndr_token_store(ndr, &ndr->array_size_list, p, size);

until the error occurs (cont 65533)



ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
p=p@entry=0x7fffdca09f78) at ../../librpc/ndr/ndr.c:1090
1090            if (ret == NDR_ERR_RANGE) {
(gdb)
ndr_pull_wbint_Principal (ndr=ndr@entry=0x5555558cf020, 
ndr_flags=ndr_flags@entry=512, r=0x7fffdca09f30)
     at librpc/gen_ndr/ndr_winbind.c:566
566                             NDR_CHECK(ndr_pull_array_size(ndr, 
&r->name));
(gdb) cont
Continuing.

Breakpoint 1, ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
p=p@entry=0x7fffdca09fc8)
     at ../../librpc/ndr/ndr.c:1089
1089            ret = ndr_token_store(ndr, &ndr->array_size_list, p, size);
(gdb) step
ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
list=list@entry=0x5555558cf068,
     key=key@entry=0x7fffdca09fc8, value=31) at ../../librpc/ndr/ndr.c:979
979     {
(gdb)
980             if (list->tokens == NULL) {
(gdb)
987                     uint32_t alloc_count = 
talloc_array_length(list->tokens);
(gdb)
talloc_get_size (context=0x5555573f97b0) at ../../lib/talloc/talloc.c:2821
2821    {
(gdb)
2824            if (context == NULL) {
(gdb)
2828            tc = talloc_chunk_from_ptr(context);
(gdb)
talloc_get_size (context=0x5555573f97b0) at ../../lib/talloc/talloc.c:2830
2830            return tc->size;
(gdb)
ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
list=list@entry=0x5555558cf068,
     key=key@entry=0x7fffdca09fc8, value=31) at ../../librpc/ndr/ndr.c:994
994                     if (list->count >= NDR_TOKEN_MAX_LIST_SIZE) {
(gdb)
997                     if (list->count == alloc_count) {
(gdb)
1014            list->tokens[list->count].key = key;
(gdb)
1015            list->tokens[list->count].value = value;
(gdb)
1016            list->count++;
(gdb)
1017            return NDR_ERR_SUCCESS;
(gdb)
ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
p=p@entry=0x7fffdca09fc8) at ../../librpc/ndr/ndr.c:1090
1090            if (ret == NDR_ERR_RANGE) {
(gdb)
ndr_pull_wbint_Principal (ndr=ndr@entry=0x5555558cf020, 
ndr_flags=ndr_flags@entry=512, r=0x7fffdca09f80)
     at librpc/gen_ndr/ndr_winbind.c:566
566                             NDR_CHECK(ndr_pull_array_size(ndr, 
&r->name));
(gdb)
567                             NDR_CHECK(ndr_pull_array_length(ndr, 
&r->name));
(gdb) cont
Continuing.

Breakpoint 1, ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
p=p@entry=0x7fffdca0a018)
     at ../../librpc/ndr/ndr.c:1089
1089            ret = ndr_token_store(ndr, &ndr->array_size_list, p, size);
(gdb) step
ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
list=list@entry=0x5555558cf068,
     key=key@entry=0x7fffdca0a018, value=31) at ../../librpc/ndr/ndr.c:979
979     {
(gdb)
980             if (list->tokens == NULL) {
(gdb)
987                     uint32_t alloc_count = 
talloc_array_length(list->tokens);
(gdb)
talloc_get_size (context=0x5555573f97b0) at ../../lib/talloc/talloc.c:2821
2821    {
(gdb)
2824            if (context == NULL) {
(gdb)
2828            tc = talloc_chunk_from_ptr(context);
(gdb)
talloc_get_size (context=0x5555573f97b0) at ../../lib/talloc/talloc.c:2830
2830            return tc->size;
(gdb)
ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558cf020, 
list=list@entry=0x5555558cf068,
     key=key@entry=0x7fffdca0a018, value=31) at ../../librpc/ndr/ndr.c:994
994                     if (list->count >= NDR_TOKEN_MAX_LIST_SIZE) {
(gdb)
1017            return NDR_ERR_SUCCESS;
(gdb)
ndr_pull_array_size (ndr=ndr@entry=0x5555558cf020, 
p=p@entry=0x7fffdca0a018) at ../../librpc/ndr/ndr.c:1090
1090            if (ret == NDR_ERR_RANGE) {
(gdb)
1091                    return ndr_pull_error(ndr, ret,
(gdb)
_ndr_pull_error (ndr=ndr@entry=0x5555558cf020, 
ndr_err=ndr_err@entry=NDR_ERR_RANGE,
     function=function@entry=0x7ffff7bcd650 <__FUNCTION__.9556> 
"ndr_pull_array_size",
     location=location@entry=0x7ffff7bcc431 "../../librpc/ndr/ndr.c:1093",
     format=format@entry=0x7ffff7bcce00 "More than %d NDR tokens stored 
for array_size")
     at ../../librpc/ndr/ndr.c:606
606     {
(gdb)
607             char *s=NULL;

>
> Then we have more hope of being able to modify the structure to be less
> resource-consuming.
>
> I wonder if changing to a different string type would help.  Thankfully
> this isn't a public protocol, so we can be flexible.
>
> Try the attached patch.  It uses an encoding that stores the strings as
> <num bytes><string> rather than <num bytes><pointer> .... <string>,
> which needs these 'tokens' to get between the stages.
the patch did not help,

Let me know if I should file a bug or can provide additional information

Regards

Hansjörg
>
> Andrew Bartlett



