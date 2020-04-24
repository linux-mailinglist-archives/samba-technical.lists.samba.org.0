Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B512A1B70CF
	for <lists+samba-technical@lfdr.de>; Fri, 24 Apr 2020 11:28:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UDHb3wiYSZgFQCYvEZk/OqPPgr//fDM3qUL7McXX17E=; b=CBB1SN0AHz+e6yOIgorABsB8Pn
	NpqGgZeovzg/I4Uc1s/YkzSE46MdX+NQZS/mlBdHt3J8q5QCrMR2u1wKO7bS69suLhsNzOwG2NhaE
	1Qj8gi9ns9pVnEW9NgCt5VCzKB+oG+aE9me6eXMKVFJdvd6jFzaS2wpwpno/TzMjSUA+edQNw6QNx
	MGHH8vFZrGV0aXyfuW+ucHZcc1tPAmDIJKNQpl7D+NWoZt6pgmBfUu9/xKTREtPFyTSMAp9E1bIni
	rb2n29B2fkRrh5gkJWlwDLkMh3UqpeBEQ7C0ybf1u8a7qFEhqisfq6m/cIZEuIrjDKkA20KqpatIK
	Yqmn4cAQ==;
Received: from localhost ([::1]:41432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jRud4-001qbf-66; Fri, 24 Apr 2020 09:28:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRucy-001qbY-0f
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 09:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=UDHb3wiYSZgFQCYvEZk/OqPPgr//fDM3qUL7McXX17E=; b=ikiufHgqcEoRY8Dyug4pWaHp3R
 Ug0Qi/+8mTnnNSfrEAqGpuBV7I0rnT9fPcS1Tdngqh6SbZCS/k3wgSTRGijPDU4UQtNGlBzicjJyE
 UQaKfLK6lNcOQKd3ALUF14doGjXoXsxM3WLi18tMqst3d0gDHeiJLEC/CooCHuEEK1A5P7/nWBuNg
 1zJsMN19+PH1ulN2ZYDplPHaQVVNlJ3eiRwcUE7kEhMpqbg8BSS0EVekLHUtuRsI2G6gMg96zmMXc
 jZWFQtopz18PjWjsWbP1w/YY4/BN+92m84fjcOGk2BjkBfVxc831zCOaVz0pU/t7ZvaLyTm8b0nEi
 4Zl7GkvNB1LzCSVojsT3rktx1IqXUKGNQ5DHkhd6lbDHoCTlZLkd+AnPqYaGo41S0J92iX0Z3Fodw
 wLzgXmxdw0rYNHJSoQK7QFs28AQMqu7HJonY7OooI9HJ59bQXK6llhgonHNYxu1/40ClazRCKDi3o
 rY1WQr19p1SvstOxhXYrOXG1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jRucx-0001O8-Lj; Fri, 24 Apr 2020 09:28:07 +0000
Subject: Re: build - ldb depends on missing system library/libraries
To: lejeczek <peljasz@yahoo.co.uk>, samba-technical@lists.samba.org
References: <af287cc4-1b97-da90-11de-60755a77fb14.ref@yahoo.co.uk>
 <af287cc4-1b97-da90-11de-60755a77fb14@yahoo.co.uk>
 <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
Message-ID: <b5f8c464-3dc2-db53-2f5e-1cd4850decde@samba.org>
Date: Fri, 24 Apr 2020 10:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
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

On 24/04/2020 10:04, lejeczek via samba-technical wrote:
>
> On 23/04/2020 19:31, lejeczek via samba-technical wrote:
>> hi guys..
>>
>> I'm trying to rpm build Samba on Centos8 but process fails
>> as below.

Have you run this:

https://git.samba.org/?p=samba.git;a=blob_plain;f=bootstrap/generated-dists/centos8/bootstrap.sh;hb=v4-12-test

Rowland



