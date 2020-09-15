Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8A26A467
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 13:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HFxN4n640IYxTPoHti7CMBPzRIaOYgKG3GNuiK2Ijuo=; b=06Kh/JiFNuTLljrLKVjxCP1pIK
	hRfA+mJSnVCkqyMhNPYqpByRTBYcC0cfLm4nRdIIzZXGL6tN0QZHpztnRt1HyS7CEM0Rw8AO2NqB5
	EXIkGoP2ubyyEP2IUB1i4TMQ8XzI6wMuYdHv0rgN/mjIyivgj5cMMTmmfUoqLIQkbswLGrMiB5F+P
	U/BGCGcJq9ak3b9uJgO5iwIIuBjYeHAHIoPlDhnrtTbrHM1NsDbGryIi6BkeR+Nrp/Opavu2l0tS4
	o5C8SzoLOxwW5AjrAh0L3CrQKGxz41QTOs6Fll6gacOh9w/IVvK3fr2AwWTA4uWurt9j/x6FNym0j
	RrWEkyoA==;
Received: from localhost ([::1]:19780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kI9UB-005U1g-KN; Tue, 15 Sep 2020 11:50:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20978) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI9U6-005U1Z-WC
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 11:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=HFxN4n640IYxTPoHti7CMBPzRIaOYgKG3GNuiK2Ijuo=; b=Njh2ijm6zDxyhAnBKdGn7G6olg
 TSJ3r04uKYtQnhllwdP1NWIB86pKFhBv7L5MuzLEuwrW807CS+EozEDKvMqVKunvqxYbNP+RitmxL
 PWoHuQuE3vsQ31ZP3RhaMYnXA9iHPhrEZtmBaJ+bwufarVawdh+CNi8KcLzVtHhwVTLOuM+0IJ6K2
 ijqPhjD0OrcT8gmBCJ8QCODv37/CVmhs0jdaU/nFWxWrKOzxCeZNFHJLLZL38+bIv+7ARaHuA6F7Y
 K9fnNL4UCgfz0WFzQlmdkofMZGW9pJv4fkStYkQU6mLemppFATZdy/R22dMsImxdM1C//5v0bXkwC
 +ZxRPEs7MAxU6QQFFCbV4NBe8nubzmduq9GpFFl5K75cFRkLaH2//bvkAtDQZaw0gyS5UlrYBgEM0
 S/Ua3YhMu8FmKFxjpdkMrTv9sQnXxnly3vJIEFlPuEaGLMs63cjTm99LlUQMSKkUkhSU51TVjObgc
 qvSES8+NJ1St/T9KBmHLett0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI9U4-0007st-Sn
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 11:50:54 +0000
Subject: Re: SELinux attributes in Samba domain
To: samba-technical <samba-technical@lists.samba.org>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
Message-ID: <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
Date: Tue, 15 Sep 2020 12:50:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
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

On 15/09/2020 12:08, Mikhail Novosyolov wrote:
>
> 15 сентября 2020 г. 10:10:32 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists.samba.org> пишет:
>> Your problem will come with sssd, it isn't supported by Samba (because
>> we do not produce it and no little about it) and even Red-Hat no longer
>> supports it use with Samba.
>>
> What is the problem to use sssd as a client to enroll into Samba AD domain?

Before Samba 4.8.0 , the smbd deamon could contact AD directly, this 
meant you could use sssd with Samba, instead of using winbind. From 
Samba 4.8.0, if 'security = ADS' is set in smb.conf, smbd must contact 
winbind, it can no longer contact AD directly. You cannot install sssd 
and winbind together, they both have their own versions of the winbind libs.

If you want to extend the schema to store selinux data, then this should 
be possible (you just need the correct .ldif), but you would then need  
a tool to extract them from AD.

Rowland



