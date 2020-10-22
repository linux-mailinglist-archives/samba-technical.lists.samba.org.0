Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCA295568
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 02:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=bZTJZoqdt1BLipx3sbwiWxUPoOGlxgN7lM63j0/JzO8=; b=XVqCWi6S+vm0LxWrPPKsI4JS5F
	cFeiwfRNnvAkZenrJD8rsToCDM/1N9JMrfmHQVlJssY84mp/paQcwl4A0Cf1kvdUNZdAC9zq7Cg32
	QMJ7dxzESk4uqghD8NFvVrct0M4ucaySKy0fTzhQkwHUJ6GO+xPbUPS3wEwQ4LBaBSI3MVN+qqP9n
	1UDyUHcfBzKWXkGx4HByPCeL9pxfGnSCtpHAE1nuhynEF5D1nq1Rffd0OjF/H4S2byFvW0zVLvWEl
	BHbhrQSpd7UNjfIsAF6Nhc8ThEf4W9OKoHjhdrgAxWcf4E6K62WfvGw3Wl37QKitcxH/MkkzwyYkA
	nKbJP+sw==;
Received: from ip6-localhost ([::1]:30238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVODd-00DD62-S6; Thu, 22 Oct 2020 00:12:37 +0000
Received: from mail.networkradius.com ([62.210.147.122]:60770) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVODY-00DD5v-Rp
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 00:12:35 +0000
Received: from [192.168.0.5] (unknown [177.240.134.64])
 by mail.networkradius.com (Postfix) with ESMTPSA id 4DBC94F3;
 Thu, 22 Oct 2020 00:12:28 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
In-Reply-To: <20201020213414.GB684621@jeremy-acer>
Date: Wed, 21 Oct 2020 19:12:26 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <D6DA2182-4015-4110-8646-69E0F0866EFE@freeradius.org>
References: <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer> <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
 <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
 <20201020191654.GF642265@jeremy-acer>
 <1C33DF9F-997C-40B0-980F-0AE27C43E1DD@freeradius.org>
 <20201020213414.GB684621@jeremy-acer>
To: Jeremy Allison <jra@samba.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
From: Arran Cudbard-Bell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On Oct 20, 2020, at 4:34 PM, Jeremy Allison <jra@samba.org> wrote:
> 
> On Tue, Oct 20, 2020 at 02:50:05PM -0500, Arran Cudbard-Bell wrote:
>> 
>> 
>>> On Oct 20, 2020, at 2:16 PM, Jeremy Allison <jra@samba.org> wrote:
>>> 
>>> On Tue, Oct 20, 2020 at 01:42:00PM -0500, Arran Cudbard-Bell wrote:
>>>> 
>>>> 
>>>>> On Oct 20, 2020, at 1:33 PM, Jeremy Allison <jra@samba.org> wrote:
>>>>> 
>>>>> On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
>>>>>> 
>>>>>> Then there's another issue with object_count ending
>>>>>> up off by one, which means talloc_free_children doesn't
>>>>>> actually return memory to the pool, and that messes up
>>>>>> some of the other tests I'm adding.  Just tracking down
>>>>>> when and why this happens now.... It might have been a
>>>>>> pre-existing issue and not related to this patch, I'm just
>>>>>> seeing it because of using talloc_free_children to reset
>>>>>> the pool between some tests.
>>>> 
>>>> Apologies, there was a steal I didn't spot in the tests.
>>>> One of the chunks was moved out of the pool into the root ctx.
>>>> 
>>>> Explicitly freeing the chunk or stealing it back into the pool
>>>> means talloc_free_children works as expected.
>>> 
>>> FYI, once you've gotten everything working can you
>>> send your test cases to me so I can add them into
>>> the regression test suite for talloc ?
>> 
>> Attached.
>> 
>>> Then we'll add a new bug in bugzilla, update the minor library
>>> version number and create a gitlab MR.
>> 
>> Sounds good, thanks!
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14540
> 
> is what we'll use to track this !

Posted regression tests there too.

Thanks!

-Arran

