Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E513C17A09E
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 08:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=F0AudT8V+vEYCILL0wp9sQPcIDhtfu/MdWPjCEF7y2E=; b=zHTSc9YgTRapHxnY8kk8LEdzU5
	RSBXCZvtJoMu3rMixdvclZlF4SAqL8cOtG+Zb2diKJDPFfxT2fpHMHKB2A4uC4ZfZiXptSAYFJaZa
	NK1gY/9wEYSqOt7JJbuOc2SzFZ6n6cFUgJ0zeFsdcS+cxBVafBAQovwt/TScm+QvK/gP5UCyv5FJI
	VgDhLHx6Yql6A/JdVy9pq7oGwEBLPh8srYQSjDJv4h7pjrCfzw7b2dfA2b3no3zGrMKAgM6g6V2xo
	QizcEiqSB4h7jpkIGc7TncoMpPdA1+x2Dw1Qbcut75ZMpjoP69bf43N0Gu3KmwgVnzwtqBZ9Hnskg
	wkxPtATA==;
Received: from localhost ([::1]:21716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9l8f-00F0n6-Uh; Thu, 05 Mar 2020 07:41:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9l8a-00F0my-KU
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 07:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=F0AudT8V+vEYCILL0wp9sQPcIDhtfu/MdWPjCEF7y2E=; b=wramrHitJSYS/w1iSMPodEwj5g
 5MNxBx3RGT6H05Ek2lLhgiXLKWZCUElCu+vgBk4TgTd5pwxydSIY/hiKjw3Dg+zcgeXTXVm3VlM5H
 e3yc2Y0W32skSagICJFshTbHdrFtJ1syCRusGVfG58M3ZUmsq2yyFcWfJYIeuogEcVol2H/SNGwOy
 mXbZSOV77PJD6uHifebvdM4oZ3yks/M8Sz7Zvb68zxXc4BqHF5rN3I3zp3+2lJLQwPavu1sXjQ6Zr
 Otq80Xmg0s7fObmLd2UotrmtGFR9gdQc9gZiZVy9YVkUybJ2+9QD5EOpqhLtp/dhKGQNAdqLslGLc
 r+XDVWLi4iF/+f4lDmhpu4fiApw6UtTFOFuU0Rk3kmQE/iGNAoDXnN9ei4bNPV0JoosjQ3Gd/tHLl
 VkeyA5UzjE2gAbVKsT/vzdN30VeuVE14plCcAoOOPQq2L5Yrn5X581Hua9VT7R9fLCESWi6UOyZOL
 crjOxX2RCj/iBGLm5Lov4cmP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9l8Z-0008Uk-Py; Thu, 05 Mar 2020 07:41:43 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Python 3.6 for Samba 4.13 in Sep 2020?
Date: Thu, 05 Mar 2020 08:41:43 +0100
Message-ID: <2195081.hYO70BUHIx@magrathea>
In-Reply-To: <7fa9094832aa924f9526d656e1dc21de823c0075.camel@samba.org>
References: <7fa9094832aa924f9526d656e1dc21de823c0075.camel@samba.org>
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
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 4 March 2020 02:25:44 CET Andrew Bartlett via samba-technical 
wrote:
> G'Day,
> 
> I wondered if we could set our minimum python version at Python 3.6 for
> Samba 4.13?

I'm fine with that.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



