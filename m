Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA848629DCA
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 16:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iJ5Kjpxe5ICb4U+HiCAc4iO4N+u4FdUyasjsTuyF7zI=; b=0P3Q0ouY8yBNih4zcEoRYmDRFa
	1mc6lxGoNRvlM4bsbe2oikBgTH8J+u95lnTbvoo/3BPmbDsS84rmjRxQ49OAomZiFt0AY0fDPpkYi
	oeOiuHwYNCc/OCrlv9AFCtQv6SfKgp6i81KE+udKjNto2ov3pQXuGYU5FfFHuE7bWUmCOTVLC99mB
	e5xvTKAWydM/XMm8RVaKlNtwe0CyD05ZnYKw5NSpKOZDTmiNMkwDqWlLpI7k++mPPpAp2NR3OkWc9
	dZ8Z/gett4W8z5xfbD2RUIW/jUBLs540Xesc1fJgsuG/W0LzbCo5xj0iVwCYC7znS3zIFl118+/mB
	sB2pH0Iw==;
Received: from ip6-localhost ([::1]:23490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouy3L-00DrJW-RM; Tue, 15 Nov 2022 15:40:47 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41117) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouy3D-00DrIy-EE
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 15:40:41 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 400A3402B5;
 Tue, 15 Nov 2022 18:40:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1C27310C;
 Tue, 15 Nov 2022 18:40:36 +0300 (MSK)
Message-ID: <61aedeea-87ca-11e7-e770-c25a5967cb37@msgid.tls.msk.ru>
Date: Tue, 15 Nov 2022 18:40:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
 <49dbbe9e-5f1b-0d8c-5d38-60e5ab7a50bf@samba.org>
In-Reply-To: <49dbbe9e-5f1b-0d8c-5d38-60e5ab7a50bf@samba.org>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

15.11.2022 18:27, Rowland Penny via samba-technical wrote:
..
> Hi Michael, I think you may be over thinking this ;-)

Heh! :) It very well might be!

> It is my understanding that the tests are designed to test the entire Samba suite at compile time. It is this way to ensure that changes do not break 
> something else. Some tests are expected to succeed, while others are expected to fail, it is when a test does something that it isn't expected to do 
> that you get errors.

Yes, that's why samba have knownfails.  Which, btw, fail if it didn't fail ;)
(I mean, if a test marked as knownfail is NOT failing, it is a testsuite failure).

> You can run individual tests, but this is usually only done when altering an individual part of Samba, a python script for instance.

Yeah.  I was thinking about not individual tests, but about group of tests already
defined in samba, like the selftest/quick list.  Here's the comment from this file:

# This file contains regexes matching the tests that should be run
# when doing a "quicktest" - verifying whether the build is working
# rather than trying to see what exactly is broken.
#
# This should be as quick as possible but cover as much code as possible.

To me it looks like a good way to use in a distribution right after next samba
release is built, exactly to do this: to test if the packager didn't break
anything.

> So, when the Samba tarball gets to you, you can be fairly sure that Samba is correct. Any errors, after you compile Samba and create debs from it, are 
> likely to be packing errors, perhaps you need your own tests for that ?

Yeah. It must be a packaging error. I want to know where my error is, find
it and fix it.  I want to know why this thing works at the samba side,
but does not work at my side, where my side is wrong and how to make it
right.

Sure I can replicate samba test suite, at least some of it, -- like from
the "quick" list above. Wouldn't it be a waste of efforts since it is
already written and in use?

> I see no use in packing the tests (if this is what you are trying to do), they are really only of use at compile time.

This is exactly the compile time I'm talking about ;)

Not even *any* compile, but after I do something with the Debian package
when I'm not exactly 100% sure for the result and want a way to verify
some basic functionality.

Though I understand fairy well this is testing a separate build,
not the thing which has been just built "for production"

> This is my understanding of the tests, if it is wrong, I am sure someone will jump in and correct my errors.

It looks like your understanding is correct.

Thank you for the comments!

/mjt


