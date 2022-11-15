Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E381629D5F
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 16:27:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CS0j4vlYRw/A1+PRkaEPt4RHl1qGKeeXVBk4429wuaQ=; b=HY+A6eo263GCV2iE//tal56RK1
	kXUYaLECauehNRJNVGA+AXESZkomzrFAwEKNGc2BNH0aL8tSLPwveubo2h98raZPWsvX9njPzffQM
	vxedj8S7W2mtH3EAuGxymu8pjz+hpbZ7ApwbUgfxnCXSoY88r3yhp8Eq48PmGU5c+IpX+cZfH9m8g
	xF6Z3FtI5w8gXzoT4gR1cwRRlbbzn/a00GfOSFGBFASaJM/m7F0K9/2InaPQP3tlwb0m/NsmCXYhE
	uTRjaYQwpMMtbCxsE1it810N2YfhxC+GAtZFempv2TqWwR4tSIFL/PKAja7tOiqi+wP+N+OIGmVXe
	9mTealYw==;
Received: from ip6-localhost ([::1]:49590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouxqR-00Dq5r-UJ; Tue, 15 Nov 2022 15:27:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28042) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouxqN-00Dq5i-Fp
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 15:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=CS0j4vlYRw/A1+PRkaEPt4RHl1qGKeeXVBk4429wuaQ=; b=zZyVBPKr2ib8y3TQfFmsuACORZ
 m1uciD1ckzJi5IP3H/Phvdjq+vRaStmF/reJj1bVHM8k2dISOHUEYUYgg+fOCadGsdaVMpMICGgCD
 HKZ/9uQ1yoiJLAmZeTSBsDgx899m2Xdcgum5MhNxKeExJvVGXs4ENC2D2RDNfgskw7Je68GXan5gT
 pyBGPHHsUo0CiUCH2k80EZjhluIAY8by4d4Jx+cnYuaTQV29C7IgIlse2dzlMPFWB8gAOFlQzQmpc
 1aCw3Q7s5p2+072rF0vltquSDX/FUN4fOi3Lv78cGFpZ2rqf7hW5EZ0YpEi0gbJyBWdkvqZcyO4h8
 zTTxU/FLPGHgpyaQYBNTbV0VgfMaykW73dBGboJyywCV5V4/9Tk3pfw1gAbBb2TQR7PnrjK9S/ofL
 2sdS6VFeZ/y5UD9ki479VXiVcesRt88MViUsOmpKMzLyMnL/2iBEvijMjsbTJwC1QcUGvkiiMYt6t
 k67F8lA2WkyOi1BrFlB7P2gk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ouxqN-008imc-0X
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 15:27:23 +0000
Message-ID: <49dbbe9e-5f1b-0d8c-5d38-60e5ab7a50bf@samba.org>
Date: Tue, 15 Nov 2022 15:27:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
In-Reply-To: <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 15/11/2022 15:12, Michael Tokarev via samba-technical wrote:
> 15.11.2022 16:35, Michael Tokarev via samba-technical wrote:
> ...
>> In particular, one can't re-run tests, because on subsequent runs, even
>> if you `rm -rf st' in-between, the result will be different, and 
>> different
>> tests will fail and the ones failed before will succeed
> 
> I figured this part out. It was my environment which was buggy. It turned
> out I tried to run stuff in a separate pid namespace without a proper
> process reaper, so zombies from the exited daemons weren't cleaned up
> properly and certain resources had become busy and was never freed
> before this namespace termination.  It was nothing to do with the
> samba testsuite.
> 
> Certain tests do continue to fail though, and I still don't see how
> to address this.
> 
> Thanks,
> 
> /mjt
> 

Hi Michael, I think you may be over thinking this ;-)

It is my understanding that the tests are designed to test the entire 
Samba suite at compile time. It is this way to ensure that changes do 
not break something else. Some tests are expected to succeed, while 
others are expected to fail, it is when a test does something that it 
isn't expected to do that you get errors.

You can run individual tests, but this is usually only done when 
altering an individual part of Samba, a python script for instance.

So, when the Samba tarball gets to you, you can be fairly sure that 
Samba is correct. Any errors, after you compile Samba and create debs 
from it, are likely to be packing errors, perhaps you need your own 
tests for that ?

I see no use in packing the tests (if this is what you are trying to 
do), they are really only of use at compile time.

This is my understanding of the tests, if it is wrong, I am sure someone 
will jump in and correct my errors.

Rowland

