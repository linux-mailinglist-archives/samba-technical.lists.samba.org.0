Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67277DFED0
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 09:57:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=4SYRshhZ4uCez+kG05WfKdsC2C4UylV/1jfjDH+4/kU=; b=aF84yXZUkCc965zYaCnRPDQXtD
	zdmWdelyzg6gQgjR29cUOFEsmhuKk+4LznC4RDbT/4smf5YiBuhYmefyEU7Gv7LmqmvATLCuXvpJU
	8c7TfjeO3HJoab8mAJmtrICcaxD6q/Ahyy1nSIx/BaUE61wBilxusaPbRnDJdBrC+0wurOK8tLe7K
	lJQNE7F2JF6XwPXVmzTS21c6LeDXN9ScVeTFPL4KXdewlUsek/LERgsaOUfCXQqcp4AaYW8giZOuf
	XjnCuwE5XaKgOMtugW/I9OAqH9QssixVBW4mrBMOqpLEd7SGctK2G77024kJVTUZVoIkJzxKivf6z
	RwUbBQhQ==;
Received: from localhost ([::1]:31822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMp2i-001JV4-SO; Tue, 22 Oct 2019 07:57:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42886) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMp2d-001JUw-O2
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 07:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=4SYRshhZ4uCez+kG05WfKdsC2C4UylV/1jfjDH+4/kU=; b=OKbhDwM+krdjAu57XGvx1KR+TZ
 gGJ0iMzwYXUtNNC0ZRufcwgFQ3B+Ot3KCSBlPmfHqDJNdoJxAfHISNgNGwWPBBLsobU5PltmTduoP
 66uE+A/4Gi9zy9GFbF446YFKrXlnNPwBJH0Zej8slVn/72TVjy91m4tD1Sfn5X5pbOZAt11jC3o1D
 MUYMWRwtG6R1BXAl74Q6PhHItE1wWwfQc1TyLqww2+pKXlLKP2yHpUqDI9WI1yHsN+fzgcQIUjSXI
 4AQHDMs3AJWj3Y0SkTFOYaVBzZ6UR4i7MY2JwCg3xqpUJVmAjtRUC3nu5qj8unARAWX1CMCt3dED1
 05uCnWr/AG0b1oF1bKg3LybF+x0lrapwL0uXLPn6Rdu/u5928nMWTjAkG08pvz57cIfYA1icGscCZ
 LluCnWwK4Fj/327YrXn6FsBx0+1Je8in53AHRqvf0QpwjgDvR2WijeQkqjfFBvCc7cM+GJsiQY3GW
 Z9FCYu4FqK9S4ohfoGmAkQHN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMp2c-0001ND-IA; Tue, 22 Oct 2019 07:57:18 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: Andreas Schneider <asn@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <8323638.P3YhLeQRCy@magrathea>
Message-ID: <477d3bdf-2afe-35f8-bd06-15bd00568c83@samba.org>
Date: Tue, 22 Oct 2019 09:57:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <8323638.P3YhLeQRCy@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: David Mulder <david.mulder@suse.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/22/19 8:57 AM, Andreas Schneider wrote:
> On Friday, 18 October 2019 14:00:53 CEST Ralph Boehme via samba-technical 
> wrote:
>> Hi Noel,
> 
> Hey Ralph and Noel,
> 
>> I don't think the additional work of letting the tests use a different
>> testenv really helps. We'll just have to go through the knownfail list
>> and look at each failing test to see what's needed to fix it.
> 
> Well SMB2 tests should not be run in the nt4_dc environment. That will go away 
> at some point. It should either use fileserver or ad_dc (if krb5 is needed).

yup. I guess the tests I was talking about (smbtorture base, raw, ...)
can mostly just use fileserver env.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

