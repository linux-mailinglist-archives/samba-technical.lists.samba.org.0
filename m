Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426265D145
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jan 2023 12:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Umi1M1UrNgxeD0NcOZpiyOwrlnOWoCwk3L6j96XE0KE=; b=KvK8oDLZpvozXOsoPDz6QaVuzb
	KCg3LQfRCAFNC7/e8Te5OX4f5qO8tKzQ7yyF7DEWzIE7J2Fh0oe2TEZYyF6UzZJD4K5JtipcfTHBG
	4QZTVwF9obBXI5e7m+xQJeRXVWqHEPp6EUqstzxhFiZBwac4OhbtDQSIY54SM4xLVYW4o4RFGeED1
	LOhwQcf7O08DpuJUHBVose2ErLi6/qy0bh5/HGxXhFaVzAacKAtGUWQuIVvCtzImousF696YA2vvJ
	8QXGJMaEmToeaAQ9DJgbkSOF/j5Go16UjZck2Em+BWr+jghxe3OYP82027qmRWFfID/OFZhN5UlSM
	PbZWE6mA==;
Received: from ip6-localhost ([::1]:38822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pD1pC-00EYCz-Cx; Wed, 04 Jan 2023 11:20:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pD1p5-00EYCq-9u
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 11:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Umi1M1UrNgxeD0NcOZpiyOwrlnOWoCwk3L6j96XE0KE=; b=Y4m+qaeJ+z57oVyadD98E91w05
 DvW4DEOKZBLb00yFDUAJQFb6k/VyLYV9zX21JJ2Y88UPTvRykhg79Dxrp8JLRrMPk7dcIO/lcF3c3
 QpsgIUTaLCcOLEAVBkZ84IowJYYKljJ6I+sYRY/46dcVzI29Ru4R63wkpQ5SW6agIDvE/G4VjOnq3
 rJREUIusbtBGSeGrKw43iOvmV+mtP3jTyQ5A81s38GcG1R0GO1P9j4OL2PdVWmLu9dSUkPbUVIc6i
 AUM++Ctpr/SoQI8qQ0kyleIjTQIHFOD8QDvpItVZcGFdN5OAKVhUU/JfU8uNP/IThJovUmS4kcNL2
 Cd48wgfCq50fDoMKHnu3Dq3GJ/CTO4NwTOPzsccYe/S7IrDa2wjhf5ZkCmZ1PAKA+kzT5rWwUPUBC
 HUz+GynyE2Xpdtch6cOULAnrYEZFmoIZNKa6i/PpZFsu4rWk1ts6PpzFOrBCsVXW5RcoGKs23mCkE
 UjryX+EYhClFXNi43KsOOw22;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pD1p4-006i5r-6J
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 11:20:42 +0000
Message-ID: <87d1b249-e025-c30e-d60b-fdac848b0586@samba.org>
Date: Wed, 4 Jan 2023 11:20:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Wiki: 64 bit printer drivers
Content-Language: en-GB
References: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
 <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
 <01c42bcc-e066-b14b-9258-0378d74618df@samba.org>
 <a4c3c03e-7857-afea-36d9-ba4141f8b9f0@samba.org>
 <ac050ea0-3d55-d376-8ff2-2a0e83d8e9f0@samba.org>
To: samba-technical@lists.samba.org
In-Reply-To: <ac050ea0-3d55-d376-8ff2-2a0e83d8e9f0@samba.org>
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



On 04/01/2023 10:26, Ralph Boehme wrote:
> On 1/4/23 11:03, Rowland Penny via samba-technical wrote:> OK, so just 
> the default changed, but where is this documented ?
> man smb.conf "spoolss: architecture". See also 
> c587685dde2448d1f68ada47ce5ad42b02a118ce.
> 
> Cheers!
> -slow
> 

Yes, I can see this in 'man smb.conf':

        spoolss: architecture (G)

            Windows spoolss print clients only allow association of 
server-side
            drivers with printers when the driver architecture matches the
            advertised print server architecture. Samba's spoolss print 
server
            architecture can be changed using this parameter.

            Default: spoolss: architecture = Windows x64

            Example: spoolss: architecture = Windows NT x86

I have no idea when this was changed, because after reading all the 
4.x.x release pages here:

https://wiki.samba.org/index.php/Samba_Features_added/changed_(by_release)

I can only find this:

Samba 4.6.0

     Release Notes for Samba 4.6.0
     March 7, 2017

Release Announcements

NEW FEATURES/CHANGES

Printing

Support for uploading printer drivers from newer Windows clients 
(Windows 10) has been added until our implementation of [MS-PAR] 
protocol is ready. Several issues with uploading different printing 
drivers have been addressed.

The OS Version for the printing server has been increased to announce 
Windows Server 2003 R2 SP2. If a driver needs a newer version then you 
should check the smb.conf manpage for details.

Nothing there that mentions spoolss and there was nothing in the 
smb.conf changes section.

Rowland

