Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4519C334
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 15:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1uvL2MEbadE2iTUhFD+w2hwqN20r4gXMCHsUipYJYz8=; b=jnCmU2EHxmI/bz3kl3eoFJIG/x
	PMGm0DyuGykLPDTvd6Hg6OPX1WZ/YJHq4BDsl/zZgq98hPzEtRU9/V9ZdovgidYCRY0yr1ZLivi6P
	OG03655nBiG9H2i307FGAK1M4AWyosg98abgAR94NLDb/mQZJrRLD8h09eqDz9fsIfKAKE5CiXHmm
	TdMNBenFaXchzaHcdj8EHIUOILx6pZnNrgO+7sM57r336mEvWDnx/EeLAsQifYZD+o41xy6n0nEyM
	R47Hx294s1BLo8whDlGqsFle7E7Q9gaDV5znyYG3qlhAylqceZg8DWl8XYblq+TWBXXSnt4Al0yD3
	YLQs25ug==;
Received: from localhost ([::1]:19298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jK0G1-0036nv-8J; Thu, 02 Apr 2020 13:51:45 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:52141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jK0Fv-0036no-6c
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 13:51:42 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jK0Fu-0002Jg-EU; Thu, 02 Apr 2020 15:51:38 +0200
Received: by intern.sernet.de
 id 1jK0Fu-0003m1-9A; Thu, 02 Apr 2020 15:51:38 +0200
To: Rowland penny <rpenny@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <0acb2828-a298-4a79-421d-683a771d9a93@samba.org>
 <9a67100a-d672-5765-227e-641ced43e683@sernet.de>
 <ebeb8392-183a-8eed-9efe-14bbc40ec31f@samba.org>
Organization: SerNet GmbH
Subject: Re: [PATCH] samba-tool group show
Message-ID: <e50908f4-1272-618e-2bdc-b0f403541193@sernet.de>
Date: Thu, 2 Apr 2020 15:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ebeb8392-183a-8eed-9efe-14bbc40ec31f@samba.org>
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 4/2/20 12:35 PM, Rowland penny wrote:
> On 02/04/2020 10:58, Björn Baumbach wrote:
>> Hi Rowland,
>>
>> On 4/2/20 10:44 AM, Rowland penny via samba-technical wrote:
>>> Hi, <samba-tool group show 'groupname'> will only show the groups info
>>> if it is a global security group.
>>>
>>> The attached patch fixes this.
>>>
>>> See bug: https://bugzilla.samba.org/show_bug.cgi?id=14335
>> Thank you for fixing this!
>> I wonder about the use of "objectCategory=group". I would expect the use
>> of "objectClass=group" instead. But I tried the patch and it works - I
>> did not try to understand why, yet. The objectCategory looks like
>> "objectCategory: CN=Group,CN=Schema,CN=Configuration,..."
>> I checked the samba-tool code and see that we typically use the
>> objectClass attribute.
>> Is there a special reason for the use of "objectCategory"?
> 
> From my investigations, this is the recommended Windows way of carrying
> out searches
> 
> For instance, you can use '(&(objectCategory=person)(objectClass=user))'
> to search for all users.

Thank you and Alexander very much for the explanation!

>> If "objectClass" is also fine, I would adapt the patch, add my RB and
> 
> Nope, I am fairly sure my way is the best way, so can I still have your
> RB ?
> 
> If so, can I also ask you to push it, I haven't a clue how to do this. ;-)

Yes, RB+ and pushed to autobuild. :-)

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

Samba eXPerience 2020 - online edition!
sponsored by Google, Microsoft & SerNet
May 26th-28th 2020, https://sambaXP.org

