Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3316292759
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 14:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oNgBUZ3GRePOUKYNStnxX9xz1VojyhCLsSr2LeiMpWk=; b=u3C9zg2fp4wnedHF0B3QuuLTKZ
	WOvpNYGUzMQyXLtIYNihjd8EvKASok3sh6iCHUTUhYtqQnsT9hPd9V3SMPDnmxGQvw+WNF/uaiYMm
	JDjnFVGAY7NUSGg1XhKfXdPqAzdMKjeHV5l/VVAZbvshaEK+7xJoqiht9zc7poZKzptYVbd/sHYz9
	yZf/rIUSt64KnoQw3bA9mrKnZgjMdIoVnMeZ81dCrQt/l34O9D1bG4zSShsB2HnjuIH3gk7/yQ3qh
	WxSQEGatyILJkSF04/5p80gURYt1C+InWK5h6geeNBzgbsxm3Xu3TzAvngF+u4nqfJ/XVDbBIhdnF
	sI/J7R+A==;
Received: from ip6-localhost ([::1]:42590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUUIv-00CiGX-Jy; Mon, 19 Oct 2020 12:30:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUUIq-00CiGQ-4R
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 12:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=oNgBUZ3GRePOUKYNStnxX9xz1VojyhCLsSr2LeiMpWk=; b=xCbccjphfuQ6VmDvMs2T8SWh6N
 tDx/CrEn5YCeO4kcBiaKsckksnjBv5pFGeUknWkaKk7M5XwH5LCELIWi1MSUTGmwvqBrTi8VOzgVm
 cSp3YaFEaScgCQNPWEr+jJm2TXwnHRTPqnv0QoZmbVuApQ7LoRI8dqIaYscdrkhbTMDjb8CpkLKgp
 HEDZIqRgfUw9JrPCT/pR6Sr4SiZSQ8TFuaC2t1on1LnAS0d/iLf1K98LCowSxMudUihOkgdKWsEca
 BelF6d3Vxh/lVfJRgyZG1y/DD8N+myVV+T4uIw1tEjaf+57XRhuiQ4D3eS+ER72cJoH0yXkHbTh3C
 fy2OuWAQsnaS0VKwz8mwKKQJmv0glOb6uhPy6VTgrXD2trIquzZQynTv6pT/mw/bJtHbwgB90TIKP
 Ftu/O511gt7vXBpP8odmwbSbXSGBY/8cnS4zAw45pUjYi0uNNOmcNyfYOzi28aBoyJrX7r4lKiiJN
 qukyF9iVFNMRUsa8o57CT2RG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUUIo-0003o5-29
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 12:30:14 +0000
Subject: Re: dns.keytab file
To: samba-technical@lists.samba.org
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
 <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
 <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
 <7214e13f-009e-5022-cd93-b7f0468c87a7@kania-online.de>
Message-ID: <37aabade-4f82-1783-7cd3-53fc12c48308@samba.org>
Date: Mon, 19 Oct 2020 13:30:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7214e13f-009e-5022-cd93-b7f0468c87a7@kania-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 19/10/2020 13:07, Stefan Kania via samba-technical wrote:
>
> Am 19.10.20 um 03:38 schrieb Andrew Bartlett:
>> On Sat, 2020-10-17 at 09:47 +0200, Stefan Kania wrote:
>>> Hi Andrew,
>>>
>>> Am 16.10.20 um 22:37 schrieb Andrew Bartlett:
>>>> I just saw this with a customer yesterday.
>>> I see this every time I setup a new domain, I also wrote it into my
>>> Samba4 book. If it's a bug should I write bugreport?
>> Yes.
> Done
> https://bugzilla.samba.org/show_bug.cgi?id=14535
> I hope I did it right :-)

OK, I 'think' I have tracked this down. During the join, 
'setup_bind9_dns' from sambadns.py is called, this in turn calls 
'secretsdb_setup_dns'. This actually removes any existing 'dns.keytab' 
from the private and bind-dns dirs, it then goes on to create the keytab 
via the commit, but only in the private dir.

Now to consider how to create the keytab in the bind-dns dir, is it that 
the incorrect path is being passed ? Or just move it to the correct 
destination (does anything rely on the dns.keytab being in the private 
dir ?), or do something else ?

Rowland



