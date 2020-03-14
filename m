Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 882741855F8
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 16:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9Qa0gh9U+JPHP63HmMa3YFxkv1lDFwMBcxiJwRoWcn8=; b=qbdBCr5gMOZgdmQk1xI0loU/ff
	36mfD6Fa3KDWS5q/Qz39fVDlCpjpq98V7xmJ/RiIrYp7IqE5JN+oyBiGjfG7wCyv2rsQ4A+52Rddh
	jyQfQIOHqV5pZveeFyGLD8Hj+C3BLm1pAQgfSl76CuI4MI1Dg2vJpuXzYOEkP4d/h3JCYPhrF8Vg/
	47dK/jVxNHcfhjZtsMdl0mBgQzbtASaqUXQ1NL5k8bIzh5FvXGcnyD476eRqSchFyRzr8ETZzaMhh
	bwUzWHHI1RMOnYsW14e49w57lQ3zJKu/IZlkvVdOJqratU4yt9VHQtLzF5mfYo4B2afvMbTpjsxCw
	02Pvd2bQ==;
Received: from ip6-localhost ([::1]:53578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD8zB-00G6BS-IR; Sat, 14 Mar 2020 15:46:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46108) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD8z6-00G6BL-5l
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 15:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=9Qa0gh9U+JPHP63HmMa3YFxkv1lDFwMBcxiJwRoWcn8=; b=IYsZqu0UV0pOpfuAINcG4YD2kF
 +kFYF/79YTwCzlssIDAVGx6Umky6kpwTT4YPGE9JUfY1DuKlkDv4MfBYLv38HWnuFePzvep0grkMM
 nEXdn0HpFH9k7NeHbLtF+2xP8Sq8oR88DeW3EY41LJDrYHOh4GMO4RP/QsBEL1CahhI+pMO/1M7de
 SJzNuVEip9cVqGbf07GZKHaFog55OaByJxq2ng1EpicYljto8QHWVBCNnxUwnR/BYoVQXXn9tQZNt
 V2o1i5tYww6s20F8xngsy5RM8e26TEGpN52LpuNPT0XF+xh3ZU9ankq5nDUhi0bU15mHnMfhpVE3G
 /UyCwtStYCnKw50RRHmOWL/F31/iu0islPD1WNy4AoWLv4GAyVj2bDo1Idzh15KJya6PeOo9r9/P2
 jkbkKxwXz+EctWDYNqQQfCTmxoSZrzR29iClUGt3UQa0tRf7CrtX1PpBevV3YatYi3xklrMc78KXd
 slZaXq26hn2H5zvtwzgdC3NM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD8z4-0000vz-Io
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 15:45:54 +0000
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
 <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
 <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
Message-ID: <1e12e848-3540-7651-8712-752600680296@samba.org>
Date: Sat, 14 Mar 2020 15:45:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
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

On 14/03/2020 15:23, Dario Lesca via samba-technical wrote:
> Il giorno sab, 14/03/2020 alle 14.15 +0000, Rowland penny via samba-
> technical ha scritto:
>
> Thanks Rowland, forgive me if I can't understand, but...
>
>> the Computers A record should be added the first  time Samba is
>> run.
> The A record is added into DNS zone only "first time Samba is run"
> or also whenever when I join a Computer to domain ?
Both ;-), the record should be added when you join a Samba DC, but if it 
isn't, then samba_dnsupdate should add it the first time Samba is run on 
a DC.
> I have restart Samba many times but none of the missing Computer name
> present into Samba Computer list are been added into DNS zone
>
> and then, how does it traslate Computer list into DNS, if the IP of
> computer in Computer list does not exist?
>
> This is my situation:
>
> [root@addc1 ~]# samba-tool computer list
> WIN10B$
> ADDC1$
> centos8$
> WIN10A$
>
> [root@addc1 ~]# samba-tool dns query \
>> addc1.fedora.loc fedora.loc @ ALL -Uadministrator
>   Name=, Records=3, Children=0
>      SOA: serial=7, refresh=900, retry=600, expire=86400, minttl=3600,
> ns=addc1.fedora.loc., email=hostmaster.fedora.loc. (flags=600000f0,
> serial=7, ttl=3600)
>      NS: addc1.fedora.loc. (flags=600000f0, serial=4, ttl=900)
>      A: 192.168.122.100 (flags=600000f0, serial=4, ttl=900)
>    Name=_msdcs, Records=0, Children=0
>    Name=_sites, Records=0, Children=1
>    Name=_tcp, Records=0, Children=4
>    Name=_udp, Records=0, Children=2
>    Name=addc1, Records=1, Children=0
>      A: 192.168.122.100 (flags=f0, serial=1, ttl=900)
>    Name=centos8, Records=1, Children=0
>      A: 192.168.122.11 (flags=f0, serial=2, ttl=900)
>    Name=DomainDnsZones, Records=0, Children=2
>    Name=ForestDnsZones, Records=0, Children=2
>    Name=test, Records=1, Children=0
>      A: 192.168.122.33 (flags=f0, serial=5, ttl=3600)
>
> Like you say, win10a and win10b are not present into DNS zone

Ahh, a Windows DC will not have samba_dnsupdate, you will probably have 
to create the records manually with samba-tool or ADUC

> What am I doing wrong
You are using the Fedora packages to provision a DC, it looks like you 
might just have found another reason not use them for a DC ;-)
> Many thanks for you patient.

Couple of answers to that ;-)

Either: 'yes doctor'

Or: I think you mean 'patience'

Rowland




