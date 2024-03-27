Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA188EC8F
	for <lists+samba-technical@lfdr.de>; Wed, 27 Mar 2024 18:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=78rEV80rRieF/9kHWM8TN9v6uNdJWgQoaAb+gOicS2c=; b=ADw05/rC2oJNPSBUgNaGAjLhEF
	th0ALCKmvLVXUETkkIw1J37SpdoNf4SK85gFBvsqQ2+HF6DVEJ+qpiMqMdWKIEF/c9YH6rlTlEBEL
	GFEBEX1y2BNMlH42pT4ys8scVzmu0TdsEs8mmjL7rWvGNT9K1PUKIWtgRVxySpyYULJEhAA8SU2mH
	86Wk4U/2Z3KbsNpLEMPr37F512UE/jEnA35IH3AxKc9EO1WKR18BDguOxqQBGRyxiN7+s7nYFIB6/
	bioYs7ev5EsTW3odpgiJP3DraOMkpQT9s9XDKNSyA+kzhAvSyr8Y0PlyzLcsjPEncDJ7iouoNyEID
	5ffsNtSQ==;
Received: from ip6-localhost ([::1]:48730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rpX0j-001PPt-Ha; Wed, 27 Mar 2024 17:24:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35930) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rpX0N-001PMw-S2
 for samba-technical@lists.samba.org; Wed, 27 Mar 2024 17:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=/8KzJv9OYZm6F2h5YIY49r2UDZM4y4Os/gO4uyfxNVE=; b=b7xVYvqqE3S2UG54gh+ukpZA2D
 aptbj68M2dlBjigu4J6JLtVIkE/4pbrO8PLm7ScNr9bD/Y776mY4UscDE5pMeNjW9CI9CvnzLaez9
 PlFjWSL9cpFeAgj7J6sUdGr4oxKSG9IfPGfTsUOHIskaLfJZyKPHAf0rT+klqrWkZUn5LhoBjXyff
 B2AUc2idQOUss/k0I9nh1ycJHrt2Tx0VmyD6Lq7z+rebHFGFDFU417i5ZycknCIHCJxOqgmsGljjJ
 /zk9DonziE50ORTnnmsYI14u9GzOVvET3l/TVvu4+khmymxc3z+kXQzFngFWgTY4ugy3iX0VP1D2B
 IZDtLT/Jd/cH3kqP6XUsY0WGF1LKXUTo2dbAIBu67IxkNLcly7BHmo90e9kQHoqoiunciAfMGixl8
 1WeeE2bv8jE2duMywLFDfzWCwNiiJ1agzs3uzQQG+LhhpNPTjBUlMeNqFM3QLIQw8rp3THbk68GzD
 w6/XeHYX85EI/ejc3YfUz2yN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rpX0N-003ExB-1I for samba-technical@lists.samba.org;
 Wed, 27 Mar 2024 17:24:03 +0000
Message-ID: <14ffbaa8-856e-4044-b90f-48bcb7d7804f@samba.org>
Date: Wed, 27 Mar 2024 18:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with today's release of Samba 4.20.0,
- Samba 4.19 has been turned into the *maintenance mode* and
- Samba 4.18 into the *security fixes only mode*.
- Samba 4.17 is end of life now.

Samba 4.20.1 is scheduled for Wednesday, May 8 2024.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de
