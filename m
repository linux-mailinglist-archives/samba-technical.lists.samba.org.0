Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926A1B7251
	for <lists+samba-technical@lfdr.de>; Fri, 24 Apr 2020 12:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=RjRs59+jpHUkWTor2160I+CT6RngodqP5kikTXp1QYQ=; b=WnDJtVKP2pUxUyjwW/0P/d4tTU
	KjDBYj1xIFWcuamj6zuKbz1yBo42Ng/mwC48AcfYOL8/IE8/dh4ArIHTKYbLfWafSHJr/W1SlwDJO
	P1//uO3rKnoQTNXO1quvOGOnrV4Q9w54YG1uyuxhVkDwUGhkffk+FYJMgRvcZnelv82/oGbnZ/svl
	bS4J0eq1l10KKhJkceO8gn3IkzZr4X2ikdhmx1wbY0MjCFyz0Ip7J25YpborCsHbgH9eYBgudErO2
	PKPwoESrjy6u2VcMdoViNHatDRQOCfK9mobDT6YW7fXZpo5/wKTSgjDQBmzlYrVA5BXZJkO4JZPkO
	STnk6Bgg==;
Received: from localhost ([::1]:49998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jRvom-001rq1-G4; Fri, 24 Apr 2020 10:44:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15020) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRvof-001rpt-Om
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 10:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=RjRs59+jpHUkWTor2160I+CT6RngodqP5kikTXp1QYQ=; b=hI9XrTUs/vEu0kTf2aUv6QLD8M
 37sAGAyT6Lq8PcF1Oa6ievFAIxQmkSCRFPrbFWquAoUPoSLkBQbf+8qQSDbtLi87m6B2NMw74wQ3k
 Lz4vr0IXW6P8dScMX+RuEPrdKyPHeMltjAqgBTCW/EKClPq2x1Is82xnF45/YImUPQa09Ua0XwvXQ
 Ql7J0+eMJZYlK2eS4j4jfEClru22gBgF16p3yOUU4yC/H9/tFLE0R0B9wJnVs0u1UOcbOMcFlDTN3
 IxHH/ih64kEqhO6xmkzygJ0EEpwI8yBBd5+VfNnNbPCmaQaPpEjW382SOKW8dAhm6PchNOl3Ss9GN
 onghPJl/Q9+dwyFE38L91cQg3DLICc9SsqkTawb5gqldsT2ZKQ0s0DcfLxhhhfX6PTHO/uRdQ4DR0
 oBJsfbsk6lx7my742Mc3pNCQ1CxeOUlJPRgJk4zF2rP0kISN5oisNnsPksV3U7UdWQa497bwozS1F
 PHR7vVNpUEhbuc6Ml33594lQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRvoe-0001vu-SB
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 10:44:17 +0000
Subject: Re: build - ldb depends on missing system library/libraries
To: samba-technical@lists.samba.org
References: <af287cc4-1b97-da90-11de-60755a77fb14.ref@yahoo.co.uk>
 <af287cc4-1b97-da90-11de-60755a77fb14@yahoo.co.uk>
 <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
 <b5f8c464-3dc2-db53-2f5e-1cd4850decde@samba.org>
 <0c073dad-8924-3bf6-fad2-12c5323d628f@yahoo.co.uk>
Message-ID: <74f63ccb-e78f-3cbc-be77-d2aa889852f1@samba.org>
Date: Fri, 24 Apr 2020 11:44:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0c073dad-8924-3bf6-fad2-12c5323d628f@yahoo.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 24/04/2020 11:11, lejeczek via samba-technical wrote:
>
> On 24/04/2020 10:28, Rowland penny wrote:
>> On 24/04/2020 10:04, lejeczek via samba-technical wrote:
>>> On 23/04/2020 19:31, lejeczek via samba-technical wrote:
>>>> hi guys..
>>>>
>>>> I'm trying to rpm build Samba on Centos8 but process fails
>>>> as below.
>> Have you run this:
>>
>> https://git.samba.org/?p=samba.git;a=blob_plain;f=bootstrap/generated-dists/centos8/bootstrap.sh;hb=v4-12-test
>>
>>
>> Rowland
>>
>>
> bootstrap.sh does not fix/help my setup.
>
> ..
> Checking for system pyldb-util.cpython-36m-x86_64-linux-gnu
> (>=2.0.7 <=2.0.999)                 : not found
> ERROR: Use of system library ldb depends on missing system
> library/libraries ['pyldb-util.cpython-36m-x86_64-linux-gnu']
>
> On Centos8 (which still is very messy in some places -
> reason I try to re/build is because with freeIPA + Samba
> integration these services fail to start)
> I have these os-wide available on the box:
>
> ldb-tools-2.0.7-3.el8.x86_64
> libldb-2.0.7-3.el8.x86_64
> libldb-devel-2.0.7-3.el8.x86_64
> lldb-9.0.0-2.module_el8.1.0+288+74592915.x86_64
> python3-ldb-2.0.7-3.el8.x86_64
> python3-lldb-9.0.0-2.module_el8.1.0+288+74592915.x86_64
>
> So what I'm doing is I use "official" Centos way to get
> sources and I follow Centos devel's "howto".
>
> many thanks, L.

The distro ldb packages are probably not new enough, Louis builds 4.12 
for debian and that uses libldb2 2:2.1.1-0.1buster1

It looks like you are going to have to build all the support packages 
before you build Samba, see Louis earlier post, either that or build 
everything into /usr/local/samba

Rowland


