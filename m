Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA63ACDD5
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jun 2021 16:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9cnpK1eaFN+Hd5GXbP8W0oo9QatNyWNGLgsOae3R2Nw=; b=gNlibgPHQOKmDzCLd6/KSzImas
	HEa2OdYuVetlrApEjxQhGKyiCCfAo6FFLAyEPjZqNZ6O/UPkcLHS4IW+Tqg7pNAc1n/3pJtLZWSjQ
	Pr4Ty7+VzaIr3Rf9g8lTSVPUrgfI0fapFF+2rxuxVTaJjW4nxQprkX2R4SRY1x0JCqg+ou4aYUdhG
	Mk2syFYHUXz6YTQ88oA9er+J3X7eZAvsC+sjeod8v9BfZlKNtTITb1boBtYnY7BZ7Yf1POzkZRPN0
	pvHCFm9cQQQMgOjpXto52oI+mKZdDGe/GNC4U4coL6G0zCVwnq/gfBc5B5N7bgODjHe/5LEdUFOum
	2TDRiUqw==;
Received: from ip6-localhost ([::1]:26548 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1luFm1-006xqv-B9; Fri, 18 Jun 2021 14:47:09 +0000
Received: from p3plsmtpa12-07.prod.phx3.secureserver.net
 ([68.178.252.236]:42650) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1luFlv-006xqY-WD
 for samba-technical@lists.samba.org; Fri, 18 Jun 2021 14:47:06 +0000
Received: from [192.168.0.100] ([96.237.161.203]) by :SMTPAUTH: with ESMTPSA
 id uF4gls0BqLRJUuF4glTahm; Fri, 18 Jun 2021 07:02:22 -0700
X-CMAE-Analysis: v=2.4 cv=G6jZr/o5 c=1 sm=1 tr=0 ts=60cca76f
 a=Pd5wr8UCr3ug+LLuBLYm7w==:117 a=Pd5wr8UCr3ug+LLuBLYm7w==:17
 a=IkcTkHD0fZMA:10 a=x_P2yaRsAAAA:20 a=hGzw-44bAAAA:8 a=tdH9x-Ss9OmRQ7VT4bAA:9
 a=QEXdDO2ut3YA:10 a=HvKuF1_PTVFglORKqfwH:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: duplicit LDAP calls
To: samba-technical@lists.samba.org
References: <CAEcb10vV+557J6mTRRw+tjTh8x34b0tud-7V2GYkzCTOMgquxw@mail.gmail.com>
 <20210616195129.GA669059@jeremy-acer>
 <CAEcb10tbH=eH-pwg6dRadrzHUczxwDMuj2hokBs6u4+YfJG6bw@mail.gmail.com>
Message-ID: <17898c98-e778-da1a-c4f5-ddcbd8944f09@talpey.com>
Date: Fri, 18 Jun 2021 10:02:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAEcb10tbH=eH-pwg6dRadrzHUczxwDMuj2hokBs6u4+YfJG6bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHcNt6at2R92JzCyPdYxuWsMBENqmhTh/Gw8QGx3qLnHkBqOHcbb4Yoh21P/ssfK5dFpKV3D9KMEoUBvgqsCTHpEDOO0i8ceW2UMzUbTrX0nE6E12jqM
 l8iuhrAj+G+GFE7qc2Y2PnehgpaB2KHyQHxpkwLnjqjMBpnmyvS6mvPSWNP71QiVO15bXC9IxqjEU/ZBbmmIU/8xwyHpCKoILEE=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

May I make a language suggestion on the commit title - the English
"duplicit" means deceitful, or two-faced. I believe the intended
word here is "duplicate"!

Tom.

On 6/18/2021 4:04 AM, Pavel Filipensky via samba-technical wrote:
> Here is a commit (it is part of MR 1999) that avoids duplicit LDAP searches:
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/1999/diffs?commit_id=9e8a41a07dfdbb05f854f54fd6cd49022031cd3a
> 
> Before the fix 'net ads changetrsutpw' issued 35 identical LDAP calls
> within ads_keytab_create_default(). It was processing only the default
> SPNs, with additional SPNs there would be even more calls. After the fix
> there is only one LDAP call.
> 
> Cheers,
> Pavel
> 
> 
> 
> 
> 
> 
> 
> On Wed, Jun 16, 2021 at 9:51 PM Jeremy Allison <jra@samba.org> wrote:
> 
>> On Wed, Jun 16, 2021 at 10:49:18AM +0200, Pavel Filipensky via
>> samba-technical wrote:
>>> Hi,
>>>
>>> during my my learning/observation of how machine account password is
>>> changed via net ads changetrsutpw I have noticed that two same LDAP calls
>>> are done in ads_keytab_add_entry() in source3/libads/kerberos_keytab.c  :
>>>
>>> 391 环贩贩贩my_fqdn = ads_get_dnshostname(ads, tmpctx, lp_netbios_name());
>>>
>>> ...
>>> 400 环贩贩贩if (!ads_has_samaccountname(ads, tmpctx, lp_netbios_name())) {
>>>
>>>
>>> Both ads_get_dnshostname() and ads_has_samaccountname() call
>>> ads_find_machine_acct() and trigger exactly same LDAP search and get the
>>> same response. I guess there are more places where an unnecessary network
>>> call is done, but at least for this case it is easy to refactor the code
>> to
>>> avoid it. Does  it makes sense to gain performance for possibly less
>>> structured code?
>>
>> Depends on the code changes, but yes, that does seem
>> a useful fix !
>>
>> Thanks !
>>
>>
> 

