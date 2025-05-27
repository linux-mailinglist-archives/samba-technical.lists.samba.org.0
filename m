Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E8763AC5DD6
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 01:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UX20xQTrImlwybXfTP/2xpsHknIaM2u13/UJBP+Asl4=; b=FFKiDuHb2FNr4TN4Oo2vahGcgP
	XTA+qB6o/DYdq3CZfD+A1FdK3k1p6SFMZaNYv1cB2VHYcfRIpqTCV4EqAAE7tm0mRTGE2nkSVu6GP
	YNCfzpDYslCVKDOOEaCRO5FQLfCz9bhexCYpDwi4MpOKE/xbasHEkit+MNm+gPq60WCvUEvmN3mIe
	Sa1cmCm6w8WT7oaFxUni48fk48un3hBTMEydUwgBig3cyV3OTB62IHIE5LqsuqUeN/OxVmPpEMq1J
	D1v9YKM/IR9HMcjMsNKE23R+MOsOue6YVCbgbVAL8K3n5Md770JhH0Opy99I7dZ86z8xtKlyp+ZSx
	cGIgWvSQ==;
Received: from ip6-localhost ([::1]:45426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uK3y2-004Ivn-3l; Tue, 27 May 2025 23:44:22 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:49878) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uK3xv-004Ivg-V1
 for samba-technical@lists.samba.org; Tue, 27 May 2025 23:44:19 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id 97AFCD1
 for <samba-technical@lists.samba.org>; Wed, 28 May 2025 11:34:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1748388844;
 bh=UX20xQTrImlwybXfTP/2xpsHknIaM2u13/UJBP+Asl4=;
 h=Date:To:From:Subject:From;
 b=xDw21pa9E96C7OecIlwhxIktWVWrLU1h5iIeEYKbDow4Z7HHQ5lFRb0h5Ucg9sjZ+
 spmvD/OerLy8Z39X6zIL0r0Xxh+XZ3Rv/uuqKXwlRgWIli//9GAZnirjKtiyixXiSA
 nV/Iju9L7U75+HD1Ti5LbmKxtpQ3mGMmdkwsHgsmB7oPpAcenl9/esbJDmQ0Rnaccj
 qqhWGogjGuiNwqKahIo5oUSzbJ8f0iR5/F1lAbsOXyjYuOC8T+visaQOFaHoA3Fdce
 RO4UtMjRJHqRaWtjTz1nrezMvTB2afuCyYb4OHTnIWxFmSr7QIyk4XlBbyJ37Nl6cc
 F+HgtVJpeMOgg==
Message-ID: <90d57927-1b1d-49bb-8f76-d3b6c04f4414@catalyst.net.nz>
Date: Wed, 28 May 2025 11:34:03 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-NZ
To: samba-technical <samba-technical@lists.samba.org>
Subject: Samba KDC support for key-based trusts and strong and weak mappings
 (+ further kerberos hardening)
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi all,

We at Catalyst are likely to be working on features that allow tight
mappings between AD users and certificates. This is getting towards
"Windows Hello for Business" support, which essentially uses your laptop
as a hardware security token.

The msDS-KeyCredentialLink attribute in the AD database indicates
eligible certificates, while a "SID extension" in a certificate
indicates the user the certificate expects. We are going to work on those.

Another thing we are going to implement are the strong and weak mappings
using altSecurityIdentities to address the "Certifried" exploit. This
will matter a lot more for Samba once people start using certificates.

Also we want to add options to tighten up Kerberos security beyond that
of Microsoft AD. These are ideas that arose from the CVE cluster known
as "Andrew's Kerberos Concerns". We want to be able to force the PAC to
be sent to the target service, and to check the canonicalised usernames
against cnames. Optionally forcing the PAC will require upstream
Kerberos changes, so we'll need to see about that.

cheers,
Douglas

