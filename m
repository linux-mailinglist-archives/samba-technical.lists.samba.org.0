Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA047A22FE
	for <lists+samba-technical@lfdr.de>; Fri, 15 Sep 2023 17:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oK8cuanWF655KJCdW9EhuPzg5gHIj/Sp7U7TAfnbjpw=; b=FvmMslg6pl+6aojwjWk2NVCliK
	ZMVmdFmObqKueXoSCOy3spMD2Z1VNrISkR91PW/J78b/EGS27I/wCM4J+UGZyTUjeDOHM+u5B3FV4
	lWkzhq7w5OCp6V46hAUwcAIN42IJUDdSo9yvURoDSdeUPzEYktfQ3Jz2Ruxel4K/tGd5/pvFAY47v
	XTf8CebWBm7dzjdrHVU8xgq+jxpcpUkHHAF9QLL6II0ZZoLoLQQvyXfxJdRYAgOX72xOFLEG6gtBb
	NPnZrUlF85SUcVLscvcKCnRRWKvJAFB/htfb7hnvYi4yPbfKMVmzdOFPObczG7NhArXH8FbPEZtr8
	gZ/eHd/A==;
Received: from ip6-localhost ([::1]:50354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qhB9s-004h5I-5W; Fri, 15 Sep 2023 15:55:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53424) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qhB9l-004h56-2j
 for samba-technical@lists.samba.org; Fri, 15 Sep 2023 15:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oK8cuanWF655KJCdW9EhuPzg5gHIj/Sp7U7TAfnbjpw=; b=ZXgjyWYrLgpFbS/zMGtHq3/CTZ
 ZuX7wLoucKlur9gEn060KTMhmm5NymAsmaOOskOdpXLklgXCZcxjOAARF/29CMrDwfh1PYhStVVyA
 okic8fV2SAlZWGsjeUH22ByikZCIVPxIndWSG7Pya/VGF0WYFqKMSSfpmiLbLO3hopUhw8GM++GeJ
 Ba6oG+8+mplUb+GcOD/cP+Ag/4QlqfKtFbiq3JYrhqBoqmo9jWHKHEd9l0Ek/lOwOPc/HjSBNRYJN
 IG37VdaSv7jrgdHQa45F6XEmtk8oAYq8DLRmxtbPEo8eV2NHDdusN6bRNrzLyhfGUKQuuDjDN233F
 u31yibVNG9AuQRjGZulYUvt8CdJqt/x1Uz6eOvd5h7cLWDiTGTgbOcrqNl6aO6ruCU1jhnu7+MdMG
 oSmDjIsDR5cdGIXWFc8L8nH9Ve+0U/OkWav6t0ia1tnCox1gbGP4RB0BLY1VtbDalTkKpVwoiUh5S
 8IGx233/dUhef1V2vf4k6Hyx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qhB9i-00DhnL-0M; Fri, 15 Sep 2023 15:54:54 +0000
Date: Fri, 15 Sep 2023 08:54:49 -0700
To: Jeremy Allison <jra@samba.org>
Subject: Re: fstat on Linux in glibc is slow !
Message-ID: <ZQR+SazJv95XzrdS@samba.org>
References: <ZQNVAogyt9Wfmje5@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQNVAogyt9Wfmje5@jeremy-HP-Z840-Workstation>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: metze@samba.org, vl@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 14, 2023 at 11:46:26AM -0700, Jeremy Allison via samba-technical wrote:
> https://lwn.net/SubscriberLink/944214/ca0c0f366ada686a/
> 
> Maybe an easy performance win if we use a replacement
> for fstat until this gets into glibc ?
> 
> We use fstat a lot and assumed it was fast.

So just call syscall(SYS_fstat, ...) in sys_fstat? That would be an easy
change.  Demonstrating that this has a performance impact would be the
difficult part.

Chhristof

