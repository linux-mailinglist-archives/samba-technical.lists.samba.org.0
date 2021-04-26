Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655E36B824
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 19:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=65NWJz6gCwZyJ84r+LSMSVMdvc3Gry7fJ/3J/etBciE=; b=bwL1E4upels9WB6TDD7PPWH2qK
	MCUORA9MRmLfi8aBQuqBiSgl9qVqVbnaRIuSSmEowMYEOZ6qbvy7BNEOwWNi16myz5xELxGmiircy
	7zvaUqvykyR0VWmQhZV1sy95r/wz83cmiVcHR+GwJtLBe4e5r5xsxtPb3T/+9ePLKG8rEG1TWKrA9
	YztIlUfbnB/opQBSxBArf474vUJOsCqgLY9GTiJsdPqxG7uu2mDZvOtwDbd/K3g61qf9qT1cIfZei
	xg72dZyCYytZolamQvACQiEP1W6WVJeX5ZBM/+knp2W4f2a34/h5oN99y6OBHi11TzeF0RPnSmCVw
	397ZAbNg==;
Received: from ip6-localhost ([::1]:21780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lb59i-00CWZg-LN; Mon, 26 Apr 2021 17:36:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24262) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lb59Y-00CWZZ-6Z
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 17:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=65NWJz6gCwZyJ84r+LSMSVMdvc3Gry7fJ/3J/etBciE=; b=n2NomoKm4KivtgWMJynY2h1yU9
 F3i4T8B2irKGRZwibVd4Sqg2M2DcMlMsE0xAXCPFnghk3s0N7bEF1X8oipmUGQKBsmwCe6eP39VMo
 FwNwiObXJGeVnkLVjGsDRzA7m+EhuHbeAOH+UTcQd+VNRpcTetJfMVc5v/LqNiVvFE6QTAq4wg7vi
 ipt9MTbjgHPJFVF4ZRqJIq3NPOnMtvB8hid1t+f29HM3kE5xGGZQRyzXcUMBDJVGSc3juG0QMix4Y
 xzcZs2iWAWtWygGj/6KJ8K2CSSXPt/A0LApOHmzthx1w0cfq7v8R7IYpFLZ4COCWKd2J5DktAgnfF
 wxWhObvZVoyX2sgz+XErUmpDQ1NXYrJZ2GDL1OpbC34XPt1fOBaECZTi/kDBzGMOhsc3zTokQKePW
 xGAkwe/x1kpSNUj3c4qca6fpNdRt+UOB08RZSD9+7l1A6RFZmrD5o/7lfSiG6pW6c7sGzmLvZKsig
 sBRKueztP8OJQA1i6zyunKRX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lb59X-0001QI-FY
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 17:36:11 +0000
Subject: Re: Ubuntu's ADSys
To: samba-technical@lists.samba.org
References: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
 <20210426161252.GA414366@jeremy-acer>
Message-ID: <40848bc1-38a9-baa4-f1a1-a82c1a7a52dc@samba.org>
Date: Mon, 26 Apr 2021 18:36:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426161252.GA414366@jeremy-acer>
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

On 26/04/2021 17:12, Jeremy Allison via samba-technical wrote:
> On Mon, Apr 26, 2021 at 10:27:23PM +1200, Douglas Bagnall via 
> samba-technical wrote:
>> I noticed that Ubuntu 21.04 was announced with "native Microsoft Active
>> Directory integration":
>>
>> https://ubuntu.com/blog/ubuntu-21-04-is-here
>>
>> It looks like this is based on a project called "ADSys" (GPLv3, 
>> written in
>> Go), that works as a GPO client.
>>
>> https://github.com/ubuntu/adsys
>>
>> They use Samba in their tests, as far as I can tell.
>
> It also uses Samba libsmbclient to fetch the GPO files
> from the server.
>
> Go bindings for libsmbclient are here:
>
> https://github.com/mvo5/libsmbclient-go
>

 From further investigations, it seems that ADsys is what connects GPO's 
to Unix and has nothing to with the actual connecting the OS to Active 
Directory. It was the Latter that didn't work for myself until I ripped 
out sssd etc and installed Samba.

Rowland



