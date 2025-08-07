Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F8B1DBED
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MJNglW5pSZSub4Cz8+ROD7eNzMeSdytgw6f6JN/dREs=; b=a/o5l3QZJx+AID2Z/RRHMlAhtf
	0onfkCzKdtx74XYHzGAyZV2kR++bj1ZDZ22p+Ri5cABr35ZBumdhjtUmgDYRmj5BRjn1+VrZPvIDD
	4kCVD3574J5TJuVc2uMEyHrciRasiYaKU0XtPPOp4J+QoqRDGsYI/CDhnDbi7CePhgKlcCSH+pUe0
	POemD/ZS5n/eJ8+TNL/sjF1rD9b0c/grV+D4YLLC8MIzr1DwsO6rI5+eCLlQ6xpoqRdMl0n67/+qt
	7N9qaYv1/jLUuQgrLnRRsYkhGE1v+4ckBVnc5DSFkjnVJssL8LjfjSAAphuUohs/DMQ68VXXzRf/7
	i/EA2nnQ==;
Received: from ip6-localhost ([::1]:19584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3kA-00EaHC-4C; Thu, 07 Aug 2025 16:45:30 +0000
Received: from isrv.corpit.ru ([212.248.84.144]:37515) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3k6-00EaH5-5Y
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:45:28 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 758B713F29A
 for <samba-technical@lists.samba.org>; Thu, 07 Aug 2025 19:44:57 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id F07D8259EFE
 for <samba-technical@lists.samba.org>; Thu,  7 Aug 2025 19:45:22 +0300 (MSK)
Message-ID: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
Date: Thu, 7 Aug 2025 19:45:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: samba-technical@lists.samba.org
Subject: new deps for new ldb module (in 4.23)
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

In debian, we package libldb separately from other samba libraries,
because libldb is used by other software (sssd).  Up until 4.22
version, this was possible (*)

Now, 4.23 introduces a new ldb module - trust_notify.so.  And this
module depends on numerous other samba libraries:

   NEEDED               libMESSAGING-private-samba.so.0
   NEEDED               libMESSAGING-SEND-private-samba.so.0
   NEEDED               libsamba-hostconfig.so.0
   NEEDED               libsamba-util.so.0
   NEEDED               libtevent-util.so.0
   NEEDED               libdcerpc-binding.so.0

what this new module is for?  Should it be part of libldb?

This is a more broad question - should libldb be usable by
its own, without the rest of samba?  It's been a semi-private
API of samba for quite a while (together with libndr), but
sssd uses it anyway, and it's been a constant pain to work
with.

(*) in 4.22, I had to revert one commit for this to work, -
542cf01bfe530 "ldb: User hexchars_upper from replace.h".
It would be great if this commit is reverted upstream too, --
if it is somehow desirable to keep libldb usable separately.

Thanks,

/mjt

