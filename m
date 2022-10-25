Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B859360D0F2
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 17:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=NECtd4AkDS3Mfv51mYufu9ZRkB2eadDR9BRs44gYAng=; b=SVFbO0HNpz4lvgzNPtTxZFvz0j
	HdxPl8RW7q615mgkUtsg+lkowXRVO7wH53w1e4n9EeRyCNCLVzQ0q18YejBWmfZE73Cx4wpZW78eA
	eRdZGI5KJ23iiA7MGudMseZgVH/RVcUhTh5bL3rDngvwAC60KuyShSvYgKnWnsgKHR9LseqOB0ikY
	eZFBtNNtJ/PsIh0Tx7TNOZ43y5Ja09FevDZBAQzFkDLw0AFKRXWH23MU0kSQFxWotb4prkcugoRYt
	DWMugBJF2snjVEuxJVaKsYOBucvITCPZ0p1xM9kP++2gKTu+ud3ttqPqkzQ+FFkTqadCAesEGpcA+
	0kgrElGA==;
Received: from ip6-localhost ([::1]:19844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onM82-005vtc-Ur; Tue, 25 Oct 2022 15:46:11 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42143) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onM7v-005vtS-7X
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 15:46:08 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 28DB540D98
 for <samba-technical@lists.samba.org>; Tue, 25 Oct 2022 18:45:57 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C924713A
 for <samba-technical@lists.samba.org>; Tue, 25 Oct 2022 18:45:59 +0300 (MSK)
Message-ID: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
Date: Tue, 25 Oct 2022 18:45:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: smbclient --max-protocol=NT1: why it requres setting MIN protocol too?
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

Hi!

When trying to use current smbclient to connect to, say, a windowsXP machine
(which implements only NT1 protocol), smbclient has to be told to use lower
protocol version than it's default - this is intended.

But the thing is that it doesn't work:

   $ smbclient --max-protocol=NT1 //testhost/share
   Unable to initialize messaging context
   protocol negotiation failed: NT_STATUS_INVALID_PARAMETER_MIX

Using -m/--max-protocol=NT1 *also* requires setting another option:

   $ smbclient --max-protocol=NT1 --option='client min protocol = CORE' //testhost/share

This way it actually works.

Can't smbclient either warn about this situation, or better yet,
lower its min protocol automatically if it is greater than
the requested max protocol?

Thanks,

/mjt

