Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B062A091
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 18:42:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XA+fb3+Q9Gs9sndZMgOnttOR+F+NsH4xYIUa9m5mw/8=; b=JfTe0KgjgRXV5xKupiUn3J3dU8
	hS5p2o6mkxZrlkN9A7HOTJDyNhGIeCUcCBYydB8vzmCwOwu1WWV9DPuOkosGIQLnjGaKA+srYUPBb
	HL9hXo82ELSzPhr5QVx4cdLxNx6Z6zehIp4r3CJ77yx4gZUPEz/tTAHf4TlchMNLkaDB2vk0685eb
	7Tg/KCsT+LNVeYYaBejA3At0U13kFHR9RpyLLx/GwF9QWwGznw0Y4r0lb6e3PDTKP8GQ2hDNqn9Z/
	X480Wn53VjNE2R6gPzHp/TmLw46g4CVLFiVsIxuapJ0QkXGoPGXPwZnOwxIDbPB4jqAm3htBMapCy
	Ed8IiXKQ==;
Received: from ip6-localhost ([::1]:23918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouzxO-00DwGC-NR; Tue, 15 Nov 2022 17:42:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouzxJ-00DwG3-Sb
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 17:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=XA+fb3+Q9Gs9sndZMgOnttOR+F+NsH4xYIUa9m5mw/8=; b=rQgt+T3FlmXPy9gfwKcm9A9C9c
 gtWVs+eDz2EavseJ/7VWU2mGl/iJykyAPOCeBzo0kL0K9i2Jm1UcQ2EBI7rtKJgB2ymRFKjTekllZ
 LPCVJPyvwrXfd4JazNJl0Zltda6VvNtb2yvh042MEowC2jtYVM0/xThJQypFIbXrmxUIMjZQAh3FL
 mEgOpC2JDqBWP4yJ79pj3n6thwjTs+ahmZSFX69f/NAkMWhrkUSM22vWtQGdBvSABASyFtgQymSUo
 i+k7akhZ2szyWqLTi8se+U8bqAg7W2AXK44NqDmeJd5AChZmwP3Y4YRsBxvScYYPjz4K5gJJtUA0+
 mMsSuuAewdqRmvyRDjUNhrYFtn9rqKbTN36WQpaapBD8C8N7LglZVtxFcsQoX+tQ/NRJO30P/TXWl
 aoL55KepF1rV8zniAmUtob+i4kpdQlkBv2qDwWkrzjmKeMB6ke0+5mSW1+pT4URDCcB6Q28SVviEm
 ZQDHoopdoHtzGFHyLdzwhi9x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ouzxJ-008kUq-9G; Tue, 15 Nov 2022 17:42:41 +0000
Date: Tue, 15 Nov 2022 09:42:38 -0800
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: failing tests in the testsuite on debian
Message-ID: <Y3PPjghJzwYBPlAN@jeremy-acer>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 15, 2022 at 06:12:44PM +0300, Michael Tokarev via samba-technical wrote:
>15.11.2022 16:35, Michael Tokarev via samba-technical wrote:
>...
>>In particular, one can't re-run tests, because on subsequent runs, even
>>if you `rm -rf st' in-between, the result will be different, and different
>>tests will fail and the ones failed before will succeed
>
>I figured this part out. It was my environment which was buggy. It turned
>out I tried to run stuff in a separate pid namespace without a proper
>process reaper, so zombies from the exited daemons weren't cleaned up
>properly and certain resources had become busy and was never freed
>before this namespace termination.  It was nothing to do with the
>samba testsuite.

Yeah, that'd do it :-).

I just did:

rm -rf st
make test TESTS=samba3.rpc.schannel_anon_setpw
rm -rf st
make test TESTS=samba3.rpc.schannel_anon_setpw

and it passed as expected.

>Certain tests do continue to fail though, and I still don't see how
>to address this.

Which tests. Specific tests sometimes are expected
to fail.

