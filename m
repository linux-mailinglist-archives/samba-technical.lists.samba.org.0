Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71113FB32B
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 16:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=57CT8H1xxGF4jRfG4Sc4Rm9BbZTyqQiccrYyEZ2pbhQ=; b=EmJ6A1d0S0BF0i3+biN1v/k1Kr
	5X1qW2chizCpdPTVVdrgO3ngXuRQJXxJEtB1aUoQDrPjsHsuEd91aUw/CCDNymDa96ZQKwdJ52H+C
	AhiX2rdbQvec9qQxDpq10vMdEpHO2sNzg5EjVrHH1q1kl4VTYGbtFaRW5AC1p2FcvTfYQui35/Y1e
	2EnGj5V+iECtT0X4/DAK6qNZN4Vw0aNlhlhrInWOwMC32FUELujNVNWFh29DiXXNIbJWP3p4F0OPg
	Yzejp2v7nxVH0p+oU+YrRLeuu5uNP7S7A1R0Db57J5wus4y7VGhnEzkc64sAdX7NDhxoA0Ep0Yb7B
	RL6/N6cA==;
Received: from localhost ([::1]:18034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUuCy-000AW8-3i; Wed, 13 Nov 2019 15:05:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43034) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUuCu-000AW1-OI
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 15:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=57CT8H1xxGF4jRfG4Sc4Rm9BbZTyqQiccrYyEZ2pbhQ=; b=r6yH+73uIbUAxACj0+iMLwNs/H
 VPuFqgISTvWgacmslBLXHi8FAxIs5Uo1lxzoc8bK0erklSLXrd7wQE/TNZXF3JHMAXxo9MtL99Z5P
 JGNQYoabGz7NBORCed/uP6F3n4BE4qlCJRxmg8rNzsr5InpKApstmxf+ic0eyx63HVsHXrZX7qw7n
 VD7g7reigo4sihww7Ld5mBi1+eHt5Gx0JimmiF+PHFRvMRhTSeCZLI2HYXhxeb1hguE/ALvcDTOlr
 eGew1iCeDoS7nVLV7ULtSoXSRDZNG1H+iUjjuQ1jHm3hssthAhm6CBIsO7WebIAWmeWZfXbX8IJ9O
 hy/Mydhdzr2TDf8ETZwfKVJkhp7AewY8F8h+0zgIeIrHwSVSmeLoZMM5mBD4NtJ4wnEQCymeFKMuF
 d6yUp2C44rmUMOUIF9TY+Z3FHcbcDe3xqJkWM8i/UFS4HVyIqfdMM1qI5+2bkBIFyTuMW+t/8guS4
 aV4LQ/C3KmyCkD1yWUFOtyPC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUuCu-0004KR-BA
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 15:05:20 +0000
Subject: Re: RFC: Add some functionality to net ads changetrustpw
To: samba-technical@lists.samba.org
References: <aa05a22c-1fae-b4e0-c194-88f8609c0307@suse.com>
Message-ID: <700e8c5e-9fb7-c0e6-75ff-7c82d112864e@samba.org>
Date: Wed, 13 Nov 2019 15:05:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aa05a22c-1fae-b4e0-c194-88f8609c0307@suse.com>
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

On 13/11/2019 14:26, Noel Power via samba-technical wrote:
> Hi,
>
> I have a patch here resulting from a customer request where they wish to
> be able to periodically run a command to trust pw after a number of days
> has expired (so something they can run in cron job) The would be
> something similar to what winbind does with 'machine password timeout'
> param. So this is something to be used when winbind isn't used.

Now I am probably missing something here, but doesn't kerberos use the 
machine password (which means ads) and this means winbind must be 
running (at least from 4.8.0), so why is the change required ?

Rowland


