Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF51D3D53
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 21:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cQ0BBo4oIx9cwnhyKT7KQNOOMFVFxv16yMRDbO9zA4Q=; b=nRG5tZ0c6Z9eIhn7KWWo3aeaOB
	fDOXNB+nS5Y89Gu3nn/zRqoAS0yX4SV6RqDXl1i9ENl8ijblUHaYAzfEbuKxagYCGZJ4sNlm5emsc
	3w/ccjeboHxVbP9gg6Oxd99bNnEpsKGRsOwwGhFeSp3u4bEgJvG0rx/oqez0QG/5gonLDxBIRq6Bi
	ghNJlUeyia+NmcyWAfRGDWPuftNPyGclUzpMeC3FVq+mlZ0DsLfS/uQabmTxkFPZyHBk3A4YwiO/x
	SmljRHH0BevLFDtnovowYgaUIWz1ItcEdGdlEOH6F+BA/ZNZMOM3GGtz0AYEnL09uzDFhTnaCBpew
	i+CPAVIQ==;
Received: from localhost ([::1]:41578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZJPM-004NVZ-LI; Thu, 14 May 2020 19:20:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZJPC-004NVQ-U9
 for samba-technical@lists.samba.org; Thu, 14 May 2020 19:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=cQ0BBo4oIx9cwnhyKT7KQNOOMFVFxv16yMRDbO9zA4Q=; b=G8pwuuGmLeB87Zp5pftv8KTf0/
 2Ai+iJwgCjmvI09zR/QL5UOLp/a6bc9Rfxk0Lpc9DxPH8z8m09tZ6MJGoFvebePEjpneHjg5j4le7
 Pj4MP/+mnp2Ktlke8fZ572WkG7Yh0EjlQyEyU4BOuZRg0OWS1gFukxNYUN1+uPUeRhmXKGogaBLXN
 UWVvbfmZ6502HGHGisYFUq98rzztiCj+2MXPLvUIGQQmF7t2jpASuCmQbyaQiTj6Re9PmiB7GtW1z
 E6v87darHcz07JRJe0xn/MRaRWPwbvegSHnxv5g5iWESPQ7uA67ZtyI4o7vbeakuj/QiUYqMwOdDq
 MFBy4x9GG63aPn90AkxmM5XJf4H70QJ1oza8PvI/wmpeoBCnAjDforf+3drjzUZPMVxFkYHadqVPq
 4J305ss4bBoQ13E5cVYgQ1je7ADMPJ1TlGLUDywPykbsDn6tKIcEjyTYWAwkthQu66y4vhuVXwDDC
 YEo7mwTFRZtMVoScBooC54G5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZJPB-0006Ts-Jv
 for samba-technical@lists.samba.org; Thu, 14 May 2020 19:20:29 +0000
Subject: Re: DNS problem ubuntu server 20.04
To: samba-technical@lists.samba.org
References: <bf44e5c1-f6ed-889e-50cf-f90395136912@gunas.co.uk>
Message-ID: <d2b811c5-5433-5195-125b-6de2933d8439@samba.org>
Date: Thu, 14 May 2020 20:20:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bf44e5c1-f6ed-889e-50cf-f90395136912@gunas.co.uk>
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

On 14/05/2020 18:57, RickJC1 via samba-technical wrote:
> Hello everyone I am trying to get Samba 4.11.6 -Ubuntu Bind 
> 9.16.1-Ubuntu to work with Ubuntu server 20.04
It looks like 'samba-master/source4/setup/named.conf.dlz' needs updating 
again, the highest version is 'dlz_bind9_12.so'
>
>
> Hostname: dc1s
>
> NetBIOS Domain: GUNAS
>
> DNS Domain: gunas.int
>
>
> I am trying resolve a problem with not being able to find the server. 
> After many days of failed attempts. I did not want to bother anyone 
> but I have been defeated so I could do with some help please.
>
>
> */etc/resolv.conf*
>
> nameserver 127.0.0.53
It should point at the DC's ipaddress
>
> May 14 14:38:26 dc1s named[1389]: command channel listening on ::1#953
>
> May 14 14:38:26 dc1s named[1389]: managed-keys-zone: loaded serial 19
>
> May 14 14:38:26 dc1s named[1389]: zone 127.in-addr.arpa/IN: loaded 
> serial 1
>
> May 14 14:38:26 dc1s named[1389]: zone 0.in-addr.arpa/IN: loaded serial 1
>
> May 14 14:38:26 dc1s named[1389]: zone 255.in-addr.arpa/IN: loaded 
> serial 1
>
> May 14 14:38:26 dc1s named[1389]: zone localhost/IN: loaded serial 2
>
> May 14 14:38:26 dc1s named[1389]: all zones loaded
>
> May 14 14:38:26 dc1s named[1389]: running
It might be running but it isn't using bind9_dlz

Try opening /var/lib/samba/bind-dns/named.conf

Ensure that the line: database "dlopen 
/usr/lib/x86_64-linux-gnu/samba/bind9/dlz_bind9_12.so";

is uncommented and all similar lines are commented, it 'may' work, 
restart bind9

Rowland




