Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAF629AA0
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 14:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yflMLMxaHmPtLC0fab7etFL+sbXy2z8mHDiieDoMA+c=; b=bB8COmIg/YbRGB8slB5PNssC6q
	g6/3p57uclkV8+ifvCl8GHJHoeH+WLm2sgjGvEtm0pzbQX5eOfioMwnvLa31G/Pm6o0g90Oi/r41C
	V7dJao3vRR2cxZPWENz+Vg2hA10hgGQkexV/szIzX0CDgjqhQ/w23OuXx6oHFABn6BGyW23LKGHDD
	eGA+g1csnVRxj3gvtpaOdhlv4iQKeXYCFj0rKyRifplOlHVYD7gG7432sVEG9Jx/qVIJM36I7IRm/
	teby6YoYTIoTSdOYnSzShdltnU0Vwi1ZIsAMzDr6qJfegBVGjsua8MnSRkPZxlx+ngJHlIfAW5ojn
	kPPPQzeg==;
Received: from ip6-localhost ([::1]:18756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouw6U-00DnmD-So; Tue, 15 Nov 2022 13:35:54 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:50129) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouw6P-00Dnm4-L9
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 13:35:51 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 01D0B402B5
 for <samba-technical@lists.samba.org>; Tue, 15 Nov 2022 16:35:47 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0829610C
 for <samba-technical@lists.samba.org>; Tue, 15 Nov 2022 16:35:46 +0300 (MSK)
Message-ID: <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
Date: Tue, 15 Nov 2022 16:35:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
In-Reply-To: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
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

I experimented with the tests some more. Thank you Jeremy for the
tip about escaping spaces in the knownfail files, - somehow I noticed
this is the case in other places but didnt' think about using escapes
in my "knownfails".

But the thing, or a request for help actually, is still here.  I found
out that samba testsuite is unreliable.

In particular, one can't re-run tests, because on subsequent runs, even
if you `rm -rf st' in-between, the result will be different, and different
tests will fail and the ones failed before will succeed, even with the
--quick test list.

eg, samba3.rpc.schannel_anon_setpw anonymous password set (schannel enforced server-side)(nt4_dc_schannel)
test will succeed on the first run, but will fail on subsequent runs:

  Failed with dcerpc_flags=0x800220
  WARNING!: ../../source4/torture/rpc/schannel.c:796: status was NT_STATUS_CONNECTION_DISCONNECTED, expected NT_STATUS_OK: Failed to connect without 
schannel
  Failed with dcerpc_flags=0x800220

On the other hand, samba4.rpc.echo against rpc proxy with domain creds(rpc_proxy)
fails on the first run (as described in my previous email), but succeeds
on subsequent runs.

I'm asking for help to make the whole thing runnable as a "quick" check
that the new samba works fine and there's no obvious build errors.

Maybe there's a way to disable some tests which doesn't work
right anyway.

There must be some difference in the environment, why auto-testing does
work on samba CI but can not be reporoduced by me.

Thank you!

/mjt

