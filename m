Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E660F114083
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 13:06:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=okceNqwmZShZv7VUV/BgvlNW2VNCme4YS+H5mnIXqAU=; b=loY9Ap8nI4nvBQxfayzcS4d59N
	qpcjiDcKtEe5uQQk+RZJftJXKVLw9K25916g8AjrcxRtwuxFJPd24HKiMI+74WLM0GgCI5hTmpAog
	gcYsZrsPQR1VIrwYgJBani2t5hgkLotTUXnIL/obKLutY0sISmnO9jSG0X0SrkPn3WYnrxUoUleoq
	jkGNhG+Fgh6wbFxLzN8Eqpqa1M2O83mNV46iwjdrlg81GrPWcI2mcw7g6FRinSDqx222jOshbzks8
	mlXIg+CNGjgDazw7wG2LszlhJCCzjIP9EPg66DXEEEOABE9jcN0Snp8O/4Qzr93iYy6vvzq5K5lLF
	cQAGjxqA==;
Received: from localhost ([::1]:45944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icptd-006CEp-Ro; Thu, 05 Dec 2019 12:06:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38788) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1icptY-006CEi-Pz
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 12:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=okceNqwmZShZv7VUV/BgvlNW2VNCme4YS+H5mnIXqAU=; b=Bh0oda8tMTrZQxKENoeV81W0jo
 r4C/WgXVGKfh3WJSdDc9w40KiFxJ1+QkrVO1y2pSou0kJOBZ/oI9xprIW5dGyfb9Kn8i7i98Y7WhW
 RHGPJ8BgmDpC+rf0Vwv90RV2zcxqjsomZ01idiTi3EiMfOlmhc02BtWuMkFqmqzxLeMKu+qQTM3PP
 H4Knm+qP6jRmJ4IORx7n+MdIQHCEvBBJ6zS1aMirh510X83g9WkcIo8ScHA23fY8TSRyNdFiq7yxB
 mW7UZIbvTJRY5sXEni6NbsJM94yom2/KeWxaJkAqCz4XmfE2HXZuglMdBVBOaVrh3SQtOEtvzSyUP
 kqEhjihEd8QU81chMFGGvlMP5AseDTLFxWSXXI+634AS4tEm1veECEd1BNKrGpoVXvhjReIWDowwf
 HXFsu7QLy52GPjnqMcPSYdqXDArlfwM6v0JQ4SGmz6PN8Ds8U8Ft5O7UIlJx6POs1A7tbc513f5jN
 OdbXBXpj8lvvl2Ea7aCX2lx8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1icptY-000334-5U; Thu, 05 Dec 2019 12:06:08 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
 <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
 <f3fcbb1f-a25c-f7cb-4023-fdef68e208a8@suse.com>
 <a146e395-f9ca-12d0-2cab-ca52e8209706@suse.com>
 <f7229830-b844-a509-ed31-9707e0101666@suse.com>
 <e09044be-713a-f074-ed2f-e41168646d81@samba.org>
 <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
 <eefa22c5-b0cf-b9e5-3d20-2fe171c53980@samba.org>
 <c6375fc6-7670-56c6-e7fa-e14acd4a4c08@suse.com>
 <757e29c2-54bd-74d4-ca66-b4a510404401@samba.org>
 <222974de-4a41-7431-ea83-3d22baac5c93@suse.com>
Message-ID: <d51cb27d-2d32-5645-008b-b7f47dca8b22@samba.org>
Date: Thu, 5 Dec 2019 13:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <222974de-4a41-7431-ea83-3d22baac5c93@suse.com>
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
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/5/19 12:55 PM, Noel Power wrote:
> 
> On 05/12/2019 11:30, Ralph Boehme wrote:
>>> In the last mail I sent, there were instructions for generating the list
>>> tests that fail when all the envs by default do not negotiate SMB1, part
>>> of the instructions included an initial skip list, that list was
>>> attached to the mail, 
>> yeah, I know, but I was not asking for the list of failing tests, but a
>> list with *only* the hanging tests.
> 
> the initial skip file attached to that mail and used as part of the
> instructions for generating the full skip file *is* actually the list of
> hanging tests, with the hanging tests prevented from running the stdout
> for the tests runs can be parsed to generate the remainder of the skip
> entries

ah, got it, sorry for being dumb. :) Can you commit this one as well?

> 
> 
>> Btw, can you add a commit with the instructions and the script? Easier
>> to find then a mail in this thread... 
> sure, probably will use npower_with_smb2_ntvfs

Thanks!

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

