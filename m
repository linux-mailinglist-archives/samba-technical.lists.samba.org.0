Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B36DF625
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 14:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=INypuy2ATibuAQzIYvVr8Us8JumQThQibsM7levj+qc=; b=hb3H/7/zYJgG0t1/+SJ+llaKe+
	SD8jv2zctbcjRmnqn1qKvqxTpfP80HdzoebAoDeQZLywxSP3RhWklXGODQt2g+H0g9yuTi8MKb4Q/
	6k4VvLRMOh/ovioRMaLGiT9JdvwyoaTZxeGEbJQWGXD/5S2/bmXLsq74x4DoitLKXkL5R9xsKfW/w
	m3LtP62gG4hPjePJ8xZKLEqePlY3g7SHErhA+ZN80C4ZhsuuhMTDXq8ZBx54gLfqapzF4wGKrlkkM
	xcZqw3F3e8Rx+6fJorOmrMWfB2/Gl76DK2Q9sNAeY8DpoV9DtWKEinjXifAlQV3/mOb6WUGDBFc0Y
	CDq+5H0g==;
Received: from ip6-localhost ([::1]:22494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmZwQ-000kp6-AV; Wed, 12 Apr 2023 12:51:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23274) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmZwL-000kox-SI
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 12:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=INypuy2ATibuAQzIYvVr8Us8JumQThQibsM7levj+qc=; b=cIMcKsoHML88rVJoaTE1j6fgGo
 TxFwIMZjvhNs6xfz2yLSGV0cUgkcVAmTlLNWDe2ndHVTj/rm1pys8HDovrLHkVAd89lrpG9gHla2q
 3JrT37mEsfRsuToQwJGXrcd/+hwzhh8aorY6vYH/nO6daA+8WSeh02HhC+5BruOclC98YNv9Shzut
 6jZl6ZfSsOl5AT2FH8dDRkzQMushJ8X56WxVq+IEqFH9q/gfxUTDZjXqQDt3mjScwNfekOsZ/e5m1
 CvE1PmF5V5mOxDKOwRsDrd0OG5FmYX0+/TT7NoKLgOaV/UUCX6zu0w6ZxJTfSfUnVIvHG53UGrxRk
 swnryyVO3QaFdgPItX3Os+wnH9KkAc84Gy9vp+6fA0wlHBIsiot1BWWhGXRoVfJhvcC6d1/4JKhyF
 phA5gotGjf/wifh1/zEppoPNrbkyORu4pYvPOXoVzap5UQT/6Rq+GZO/dItlSDJVYaHt6pEfWLRbO
 8Cx1yWd6/CmQQPcaidAiSucZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmZwL-000hrm-7M
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 12:51:09 +0000
Message-ID: <93859d7c-eaf9-0a93-a236-53a172381782@samba.org>
Date: Wed, 12 Apr 2023 13:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: How to test samba LDAP parameters with openldap tools, eg
 ldapsearch?
Content-Language: en-GB
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
 <19d97578-4936-6197-871a-5996f32cfd54@samba.org>
 <d1cc4ccf-a8a0-0ef5-e418-1e406490fa80@comind.io>
 <0ca6506a-af76-a2ec-626a-5ee11ef7952e@samba.org>
 <04c86436-6665-354f-84b5-479613a81545@comind.io>
To: samba-technical@lists.samba.org
In-Reply-To: <04c86436-6665-354f-84b5-479613a81545@comind.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 12/04/2023 13:37, Jan Andersen wrote:
> Hi Rowland,
> 
> I noticed something odd about the logs: it seems smbd generates one both 
> for the workstation's name and one for its IP address - I didn't attach 
> the latter, so here it is. It seems to have more detail.
> 
> Jan
> 
> On 12/04/2023 12:06, Rowland Penny via samba-technical wrote:
>>
>>
>> On 12/04/2023 11:39, Jan Andersen wrote:
>>> Hi Rowland,
>>>
>>> Thank you for replying. I wiped the existing logs, changed the smbd 
>>> service to include '-d 10' and restarted, so I would have logs 
>>> without too much noise - please find them attached along with smb.conf
>>>
>>>
>>
>> You appear to be running Samba as a standalone server with an ldap 
>> backend, are you aware that such a setup is two parameters away from 
>> being a PDC ? If you comment out 'server role = standalone server' and 
>> add 'domain logons = yes', it becomes a PDC and a PDC (from 4.8.0) 
>> requires winbind to be running.
>>
>> Rowland
>>
>>

Before Samba 4.8.0 , smbd could directly connect to the domain 
controller, from 4.8.0 smbd now needs to go via winbind.
Now I know that you are not strictly running a PDC, but what you are 
running is the next thing to it, so I presume that you need to run 
winbind, you do not need to configure anything, just run winbind.

Whatever happens, you should be aware that Samba is working to remove 
SMBv1 and things like PDC's with it.

One thing I did notice from that last log, you are not using SMBv1, try 
adding these lines to the smb.conf:

server min protocol = NT1
client min protocol = NT1

Rowland

