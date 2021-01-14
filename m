Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403C2F5DC4
	for <lists+samba-technical@lfdr.de>; Thu, 14 Jan 2021 10:36:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=0Bn/nomYW2TVvBI1+mELwB/Ld3kM6LjljD494R22S2w=; b=3B5y6GqBvd0bCBJWfI2Pf0c2ds
	9serqgpFX41KI9nXQVQ/buBOwtVoLnNFb5nc+z41Z+nw/C4Jy4t7rrD5ZRHP8u1FipSaFFR5rzi6l
	YrBeHNLLUU+Jp26zTx9YTkT3lQLBPX6ieZLtxDEakq9HYxvIQMlxswYo2+Kj6+2iTnW5Yjh11g63b
	tHvdV8x/vklK1eYT98JGSQNbjC9Z6aHIRGLb8EUR5sPCrzjRZXZwUGAUr7po9TszvlFYVtfNSd8TQ
	uAaMhEnY2XLdfbO08NHsctHVLr+HaAZ1r7n9GtWY2TRG/TfGRbolROHoSK1m+OyM3GsrcOcb17dC4
	zpWeFw6A==;
Received: from ip6-localhost ([::1]:50802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzz31-005dOk-1k; Thu, 14 Jan 2021 09:36:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58352) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzz2w-005dOd-JJ
 for samba-technical@lists.samba.org; Thu, 14 Jan 2021 09:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=0Bn/nomYW2TVvBI1+mELwB/Ld3kM6LjljD494R22S2w=; b=Tr3WSS+fXSrCWJv8SUFY6jGmbO
 /l00aTQDG1PBhXL8NKanhwjc14gjGVUs2k9GZAqEAusfi5xRR+V1WksMAwpeIlHFh+bxRXG++fVU4
 RWhIx3fZ7mU4F7K5W3BhwVBHSKFC4F8rx7J4+pkwLYPry7iw+mrhL+RJG+ePOHV8oeaGYovmBLjbd
 caeI7hg2HZGw7EbLXaRJlcvP8ZVXBvlXtPfYl2hFwCLFgI+1wd2fsc3tmWUcY9IruvfyXfGtiF3/W
 fLgs3stDcwGwMKp2jSN1eEa/Rp/LVzcr/i/h6VkuXmteoWqED4HbbItPZJo9VhjZ/RRfmhJfWg3Sm
 RIglvWRUCebNMNYUospJC7wqomkLAb7JHt7poVUZivCsYhCSh+J0vw8kyYIVXOAJDc9HVpgn1qLSN
 xLAtEEqG5BbCTgpyxN/W2VIw5VrVXggRSx/d8Oxlc+/9BuqsySLasorQbVpBHNbyKjQu1hGRpwmfX
 vmSAtcveeln2YKfoxP1K1Z4q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzz2w-0006bU-6w
 for samba-technical@lists.samba.org; Thu, 14 Jan 2021 09:36:02 +0000
To: samba-technical@lists.samba.org
Subject: DCOM WMI
Date: Thu, 14 Jan 2021 10:36:01 +0100
Message-ID: <2384324.bt8ldtCKjX@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I've just recognized that source4/lib/wmi/ has a wscript file, but it isn't 
included anywhere. This means the code isn't used nor built.

What should we do with this code? Can we remove it?


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



