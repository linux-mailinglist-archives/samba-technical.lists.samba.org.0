Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 017816DE311
	for <lists+samba-technical@lfdr.de>; Tue, 11 Apr 2023 19:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JIjHcEVUyY5MslDLyT6tPWvgLiKq8GI/KDr04lzbDgc=; b=sLBESexhflGDC7MxG1iKp/Rxpc
	omQjzpZscUMbKI6lnxv+U6BFqBuLUMjn/oO2GF+OezazMHEawWWzcg1rf613GAgpbKQyN9kuhreTZ
	Lz8+Cf1kJnc6riqpeuXfoHhXgT37guiYrRo9F9m17zGJVbX4NExPWz7Kl1kLcaslkX/2ETLY0FG3Q
	NxMfcmp37H2vJASl3rD49Ed/7cR2D2ldsdVCb9lKc0hnNb6R9wyFVEvgzVDn8MCWEyWzIRPTUw/eY
	MGvCCEMSfKe5p9ZkwjSIXvpJXcbhdiEnEq63pgXbcT01UqGaW1qsAtU0+CB9rNzm1/DOoFIP+MaZ/
	URK0AYMg==;
Received: from ip6-localhost ([::1]:61296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmI5y-000PSZ-IJ; Tue, 11 Apr 2023 17:47:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55976) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmI5r-000PSQ-Gv
 for samba-technical@lists.samba.org; Tue, 11 Apr 2023 17:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=JIjHcEVUyY5MslDLyT6tPWvgLiKq8GI/KDr04lzbDgc=; b=hZW1SJdmrv6zimcdl763LQZR2t
 kpMIjfYvnc6FOG+KuStkemQQ+8XiaVpKlrSV9xHNcdloCDGyZQ0RcdQAB4oHZUyhAoRdld6b+GG4H
 81F6U5usVV5hPCN2MFbCSmRGlQ53scZfYHpW5grK+VJ7mEX1T3QuMZ/n6VZ8j5tmaQrpzeEobvn5j
 4ATRzlu95mlPBAYMTme7bo3UNG6Eh3lMXqQZH+iDRfcBQWc7GOwyxvXOKLdyncVi7dsWiStYBj4m8
 viCROVDlQ4ani0t3TzQrQ+xC8ZyiSG/Eqhj7wr8/+/EKa7DQtYM4Y/+Ill0P0LeY3nzoJa37vWUDZ
 CCNd+OcVNzA2DMhj5CuH8+orzDpZrtuxz391hORfMk49MePs9o/43RXCLQoAh+J/q7qx+mRwdGY5Z
 aG89W38Kk5KbivJA2Wxwcl2VT3/xFV7o/OPcbXP0W2r76G14wAk3HDzoDyPlpVPR5F24hScgdnqJv
 fYY7oQd3MsI9xBWzkls8gmfE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmI5q-000VJA-KY
 for samba-technical@lists.samba.org; Tue, 11 Apr 2023 17:47:46 +0000
Message-ID: <1d47d63c-854a-0622-c6de-3965dbeb3804@samba.org>
Date: Tue, 11 Apr 2023 18:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Recent Samba (4.18.0+) winbind configuration ?
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
 <ZDWVzOaPP7SNIxOf@jeremy-acer>
In-Reply-To: <ZDWVzOaPP7SNIxOf@jeremy-acer>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 11/04/2023 18:15, Jeremy Allison via samba-technical wrote:
> On Tue, Apr 11, 2023 at 02:32:27PM +0200, Jiří Šašek - Solaris Prague 
> via samba-technical wrote:
>> Story begins when Samba 4.14.0 changed its VFS so we decided to skip 
>> 4.14.x and also 4.15.x releases to bundle it on Solaris but various 
>> problems were also with later releases and we were only fixing issues 
>> in 4.13.0 . Currently (4.18.0) the situation can called be critical so 
>> I focused on recent release.
>>
>> winbindd is giving up and I think the key could be in log message:
>>
>> [2023/04/11 11:28:53.090661,  5, pid=1525, effective(0, 0), real(0, 
>> 0), class=winbind] ../../source3/winbindd/wb_lookupname.c:
>> 52(wb_lookupname_send)
>>  WB command lookupname start.
>>  Search namespace 'smbsetup' and domain 'smbsetup' for name ''.
>>
>> ...where "smbsetup" is my domain  ...and I have added core-dump here 
>> to freeze the stack:
>>
>> [2023/04/11 11:28:53.090780,  0, pid=1525, effective(0, 0), real(0, 
>> 0)] ../../source3/lib/dumpcore.c:315(dump_core)
>>  dumping core in /var/samba/log/cores/winbindd
> 
> Jiří, please open a bug and upload the full backtrace.
> 
> Thanks,
> 
> Jeremy.
> 

Damn, I missed that, focussed on how wrong chatGPT had got it wrong, 
anyone heard of 'autorid_compat'  ?

I still think that Yura needs to post their smb.conf etc.

Rowland

