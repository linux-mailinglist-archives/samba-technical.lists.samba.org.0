Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909B845CE2
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 17:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=hjQl00WtoBCQHtBi+MGn893qN5t69MyPhWumveNY4WA=; b=bnngB/ZYc0ODZZBEhDgDn1kAER
	lCQCbSp1FTE6nhU8RwvQWqvKLbmQaj0t90wFRuyFQRPIOO6fMDZjuLy0j1WqQ4o8Es4tvktZB6Cm0
	Ws+7fHel0h5K16SEG/XKWrgsdXA4RwIoHEht8mTqubKASUiqlZephKh91sNLF7U6OJ/IyPhMhbF9c
	15PxPEL5vuNix+EYgGTFUrt71CLpABvyZkG7FZymsrL4tFq7ndTpkYSYpvgbRl1TXpruNCtnQ3TCa
	Ujziu508aVXXaofNhJMvAE+XMwzkyeXDawMfoX8BCSTepAl3mg/olV/ga5xUILrYiC1tHKbnpqmpe
	9wW4pr8Q==;
Received: from ip6-localhost ([::1]:62674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVZjk-007HqY-5X; Thu, 01 Feb 2024 16:16:24 +0000
Received: from mrkos.uberspace.de ([185.26.156.186]:42146) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rVZjg-007HqM-7t
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 16:16:22 +0000
Received: (qmail 31977 invoked by uid 990); 1 Feb 2024 15:48:15 -0000
Authentication-Results: mrkos.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by mrkos.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Thu, 01 Feb 2024 16:48:15 +0100
Message-ID: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
Date: Thu, 1 Feb 2024 16:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: State of unix extensions and symlink support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.096905) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.186905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lrose.de; s=uberspace;
 h=from; bh=hCUVJeBBa3eFIBQlnhnFLSRd4j+nAozH20brRtJ7LwU=;
 b=qP5RfaywDUcTt0XbrCTUzGdZVimaS5jHbEh5pEXLr28CrOTSU/u095J9ko5DSPTCpaePwFjMwW
 mB9Mjx5gbGCzUOaF4FLizC9j8wFsLbAxNCF6rorrbWUGSVAP83VpkiQ4mls/LEwoJpbQL5wpa6h6
 cC+laXbHLaP9vSmw+EvD1oXAkaFEP0JDBfrUV9pX0RVL7XvXzx2r/sspIgqsfHFW2mcTjjNGjrGm
 NRgPBAqxgrDLA8piaCNcygS2vd5QiTm3EtKrhEuNQDR89eC430Br265VXZg0g53FUYtS1HkflNkL
 GHp44L9g7+oYOJzxh4RzPq1vWEoMZR8V4pPR88ysWFIFtkfO2oXU4LbceU6nv1CTCrhWW4ZJVKkL
 V26VgBWGNyUR+PUq4TbVHGJRBXfe362Pq+jpTu23yQGcK0tOORn9piSFyGSkUF+ftPKYW39qtICT
 35JaHmiKg64/EySK6xR7OnDTgJCgQM4nim61ZrkUggLCoF3w4OJWSNhj6Cop+oxxdH86CqcMLqIK
 RF/wyZ32Cs74e+G3ZFvXo3lNbUs/qnebhm/VbFdctqgkCsM6LOxJ67mYzBeU+/6nEz0QhoneYgKn
 ofamPs4B67czeKXg+8fLtSUywdTIoM9utYC3927P02YlWL6q98dTmyvsLpWN6fMviKZNMubgA70n
 g=
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
From: LuKaRo via samba-technical <samba-technical@lists.samba.org>
Reply-To: LuKaRo <lists@lrose.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

is it possible to create symbolic links using the Linux cifs client 
within a Samba share on a Linux server? Or is that entirely not possible 
at the moment? I have read that smb3 unix extensions are part of Samba 
4.18, but only when compiling in developer mode?

Thanks for anyone who can shed some light in this regard,

Lukaro


