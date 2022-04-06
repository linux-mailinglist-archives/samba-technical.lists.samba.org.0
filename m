Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 617854F5A95
	for <lists+samba-technical@lfdr.de>; Wed,  6 Apr 2022 12:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=NiYbG2eWjUFSn02TVWHeNLF8QKK6VeGkhGkarU17jig=; b=DLXolY8hAB75yFzO9flUM8aHMs
	9K5kpZdYGup8LCeH9CMv4REw3bPumuIYUpFGAY25bC/3CFFHL6+l+fccMMXTILFVV9ijfHqTGiNZj
	MklN4gPnj0vSJiIgtHmKlEAM1cBJUpQZsea6GXpHnBFUsV/RoyuYh6AMnyNi5gSaZd0kTo7mN8iFu
	HE0SL7UxqBSlie8fFYkkt/zxh+zrAFMt5DuFgN/5dBizXtC1PWhR3Lcb9gG/UR7mPu3mjm4ihmvY5
	av68hDEF3n2/WGJd04oQsJeJI1V0lvDw7f6bXnKL0xmwhy36ERCY31U/7qFxxeHdtHW99DUkfFacu
	LWK2vVSw==;
Received: from ip6-localhost ([::1]:53796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nc2zn-00ALiX-7N; Wed, 06 Apr 2022 10:34:39 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51489) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nc2zi-00ALiN-0C
 for samba-technical@lists.samba.org; Wed, 06 Apr 2022 10:34:36 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4BD6540161;
 Wed,  6 Apr 2022 13:34:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8B349352;
 Wed,  6 Apr 2022 13:30:45 +0300 (MSK)
Message-ID: <b14d999d-ad6b-b080-a5a2-70dc54331bc4@msgid.tls.msk.ru>
Date: Wed, 6 Apr 2022 13:34:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: doing a test build of samba
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <0a7f7fb7724efaa78937a1020ffb110eb5e6b75f.camel@samba.org>
 <1b3f5415-f263-8b56-c66d-77049719b018@msgid.tls.msk.ru>
 <5417159.ZASKD2KPVS@krikkit>
In-Reply-To: <5417159.ZASKD2KPVS@krikkit>
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

06.04.2022 13:22, Andreas Schneider via samba-technical wrote:
..
> You're aware that the testsuite runs for 4-5 hours?

Sure.  I've run it a few times already :)

The --quick version completes within 10..15 minutes though, - this
is already a good start, but it too requires a --enable-selftest
build.

(BTW, the quicktest fails for me in a few places, namely:

# REASON: Exception: Exception: ../../source4/torture/smb2/session.c:5006: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr 
incorrect
^samba3.smb2.session enc.(reauth.|bind.|bind_negative.*|bind_invalid_auth|encryption-aes-.*)\(nt4_dc\)

#REASON: Exception: Exception: ../../source4/torture/util_smb.c:856: Expression `torture_open_connection(&cli1, torture_ctx, 0)' failed: Failed to 
open connection
^samba4.ntvfs.cifs.ntlm.base.unlink.unlink\(rpc_proxy\)
^samba4.ntvfs.cifs.krb5.base.unlink\(rpc_proxy\)

As everything, the selftest thing is new to me do I don't know what to do with these :).
But this is already a very good start.)

Thanks!

/mjt

