Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F23024AD
	for <lists+samba-technical@lfdr.de>; Mon, 25 Jan 2021 13:11:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=f8g8uoomFMendcrQcwaPmGPao3aOaTfCSVyE2tD4kGY=; b=YMr8CgvdrIkP76XzQtudZvmwza
	tLweHx0pDRqbyO5Rdlavlye9HcKSqT+tBjslWFD56uM/WhMUgSx/A0ZOA9ldSdxoAYIeMtNgr3w5l
	ND0e10FBPgzLqu0JeB7XbGdn/BGrpypRSoAcvfA/PO7tCKJrarfH79wLDQpQYsYGbBkccDJvsZQKa
	OeO30Iw/vvU2PSS2oJ1+fbaRKHlYIO+MnINCLHN3CL+cgfBiKr1Ngzw3ffyxMqPoV0M61cisL82C8
	WGJVAooluyey5b8H7Rc90orr5zb/Cvw52h9OotywLjOBpp3d7WUWF5T9hRRVCU99mxqw4SiFCtlQK
	4Fn43KGw==;
Received: from ip6-localhost ([::1]:54686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l40gV-00727I-KS; Mon, 25 Jan 2021 12:09:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10000) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l40gQ-00727B-0w
 for samba-technical@lists.samba.org; Mon, 25 Jan 2021 12:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=f8g8uoomFMendcrQcwaPmGPao3aOaTfCSVyE2tD4kGY=; b=eDwKOVg2zu2AfHNWsoBsbL5Jjg
 ljkgNNZmzi1sJWmWlePdTQKfNan7n/UZ5S9vKCNDQYoODRPlF2poAsZgOOPjwt84z7EZY7A5DIa1P
 12vUkmBZZ8/gI+WmdJ1SJANaGbS7Ufnf2bmNn5uoQbYJDXUp6cQIm5LsKLdHiobsQNp34/wkk6id/
 TX2Nz3YkMhi1VLFWAsiERS2GDUNclfxfCs07nytWxa41NMUUgWqqv0oqwkg3TyMHRvVWh4ScxNqu2
 0Mm69cccewqWYiXXnLrDxjRYDhHSYAXR/9a6CAmPlEWltEnE5cKLnxZz+gmq1mfcJA3qNjtfc7Bf1
 4ji6z15zV8LdJOsZQIiaJ+jk/fzM1xUGFcYwikOF1zP/7ISpitEjYZz4iIzcwDkUQxudEYV1lIyWj
 l9zeLeg0YJS9BRfHy3FwKVbCxva3gBQAqCQSccAL4vF+yBG4gGsw3SQLm0ercBTYlLEOGXQJ1Ao4y
 d+B/2TzH7Judw4LzYyoLowHg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l40gP-00054W-3I; Mon, 25 Jan 2021 12:09:25 +0000
Subject: Re: [Release Planning 4.14] Samba 4.14.0rc2
To: Nico Kadel-Garcia <nkadel@gmail.com>
References: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
 <CAOCN9rwAE2wsEkgkMmxvi6i2QxBvvaGNNcWh5E4=az3HwsA=ng@mail.gmail.com>
Organization: Samba Team
Message-ID: <f3f76bc2-6dcc-fbb6-21b3-b2c47803ce74@samba.org>
Date: Mon, 25 Jan 2021 13:09:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOCN9rwAE2wsEkgkMmxvi6i2QxBvvaGNNcWh5E4=az3HwsA=ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Nico,

Am 24.01.21 um 20:21 schrieb Nico Kadel-Garcia:
> On Fri, Jan 22, 2021 at 4:51 AM Karolin Seeger via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>> Hi,
>>
>> Samba 4.14.0rc2 is scheduled for Thursday, February 18 2021.
> 
> Sadly, samba-4.14.0rc1 has a dependency on tallo-2.3.2. Any idea when
> that will make it to https://ftp.samba.org/pub/talloc/ ?

talloc-2.3.2.tar.gz is meanwhile available on
https://www.samba.org/ftp/talloc/.

Thanks for the hint! :-)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

