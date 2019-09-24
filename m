Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E3BC485
	for <lists+samba-technical@lfdr.de>; Tue, 24 Sep 2019 11:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5tIdVXvhI3drj4ZVr67Ae+VAplq/aEQVC/pRwtwA384=; b=34xdwXIDna4TTJP5zfwlDfzBMD
	L1MXFSF9Wuf95cEYgBVcYKj2/Rfa59z+OyCdy93gnXVDmTzz4XjS7D3ig/BbJqOm0w3kGAY7Q/jOf
	rNJmP+cJ6Z7+GrYyjC+aa9XmBmPOwHrPVtEZGEQ9ufBe6ECegh0qjq6SmrFpmxBsZ9vsikeadReVM
	2dXaGln+c6coSnrc6LMh/R9skuWfbYQUR1sQDje9jUiZWLBtOmpk/dTHBTpZGC3syTRzBO83lYQko
	43qvZuJnv30R2k2LDL4ahNB3+WMu7KM9wWBTk//qBviZmeKHCAaabN1RflGNB3SbEL63n5UaC62PJ
	tMrVjgnw==;
Received: from localhost ([::1]:40318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCgov-008AxE-6n; Tue, 24 Sep 2019 09:09:17 +0000
Received: from smtp1.lauterbach.com ([62.154.241.196]:39903) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iCgoq-008Ax7-6S
 for samba-technical@lists.samba.org; Tue, 24 Sep 2019 09:09:14 +0000
Received: (qmail 10391 invoked by uid 484); 24 Sep 2019 09:09:09 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.11.10 by smtp1.lauterbach.com
 (envelope-from <Franz.Sirl-kernel@lauterbach.com>,
 uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.11.10):. 
 Processed in 0.325855 secs); 24 Sep 2019 09:09:09 -0000
Received: from unknown (HELO [10.2.11.10])
 (Authenticated_SSL:fsirl@[10.2.11.10])
 (envelope-sender <Franz.Sirl-kernel@lauterbach.com>)
 by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP
 for <samba-technical@lists.samba.org>; 24 Sep 2019 09:09:08 -0000
Subject: Re: [Announce] Samba 4.11.0rc4 Available for Download
To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>,
 samba-technical@lists.samba.org
References: <20190911065708.GA7868@carrie2>
 <8eb21452-8d69-d9b6-1467-d663bc71cf6a@lauterbach.com>
 <74e57095-a057-e25c-97c1-c0b1642f4e4b@sernet.de>
Message-ID: <114eb6bf-ba54-d048-17e1-aeb3f52e3216@lauterbach.com>
Date: Tue, 24 Sep 2019 11:09:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <74e57095-a057-e25c-97c1-c0b1642f4e4b@sernet.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Franz Sirl via samba-technical <samba-technical@lists.samba.org>
Reply-To: Franz Sirl <Franz.Sirl-kernel@lauterbach.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 2019-09-12 um 17:25 schrieb Björn Baumbach:
> Hi Franz!
> 
> On 9/11/19 3:15 PM, Franz Sirl via samba-technical wrote:
>> just noting that 4.11 will already be the third major release without a
>> fix for the https://bugzilla.samba.org/show_bug.cgi?id=13745 regression.
>>
>> Can someone at least comment on the bug so I can work on a patch and
>> make PDF printing shares (via smbprngenpdf) functional again? Just
>> moving the new %j/%J to %k/%K would be enough to fix the bug.
> 
> Thank you for the reminder.
> 
> Not only %j and %J are affected. There is also %p, which is used twice.

Hi Björn,

%p is handled in talloc_sub_advanced() which already is called "later" 
in code flow. Additionally the %p functionality in talloc_sub_advanced() 
is less likely useful in a printing share.
The problematic thing about %j/%J is that they are handled in 
talloc_sub_basic() via lp_string() without a way to intervene. Moreover 
the functionality could also be useful in a printing share.

> I've requested some comments from the samba team regarding the issue.
> Metze added some notes to the bug report. There is still no decision,
> but there are currently two ideas:
> 
> - make sure that the printing related commands are processed by
>    standard substitution *after* the printing related substitution.

I've added a tentative patch doing this according to Stefan#s suggestion 
in bugzilla.

> - add new substitutions and throw a warning if %j %J or %p is used

With the mentioned patch the talloc_sub_basic() %j/%J functionality 
could be left in place and %k/%K could be added, duplicating the %j/%J 
behaviour. The %k/%K could then become the only documented variation and 
testparm would warn about %j/%J usage in a file share.

> <comment>
> Stefan Metzmacher 2019-09-12 12:56:51 UTC
> 
> Another possible way would be to mark the printing related commands as
> constant="1" in their documentation that should avoid the lp_string() is
> called for them.
> 
> Then we can do the printing related %j substitution first and then
> call lp_string() as a 2nd step.
> 
> Yet another or additional way would be to replace it with something that
> doesn't require a single charater, similar to %$(envvar).
> Maybe %{jobid} %{jobname} %{clientip_pathsafe} %{serverip_pathsafe}
> %{printername}...
> </comment>
> 
> Maybe we need both here.

Yes, I agree, %{long_name} sounds like a nice addition.

Franz

