Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F3820071
	for <lists+samba-technical@lfdr.de>; Fri, 29 Dec 2023 17:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NKz/uc+BSnXfJrlFDCo1YHpsQp75sUcISpy4NlnEtuA=; b=XH7/OEphv6jEZOVhnvhmcYF9rI
	yrda+yfEsvSmZKl3cKZo811qKqn94Z1CYJEFOo1pkd8yP5ZkGWQYN+Cv5kRjDuq3f4NCzhg+LIPmj
	yejiY8NotC7L9QVZ/pI8p65gFYfMZlWfAEeGH1wNqwJNDRoYPCjEVlblsdvU64ZE1/L3IWJsFdFI+
	4bThXsu4eF/7E8lNcfZ2l5DDxP+V5W4UsVds2Z2igvKyBWhNqHynd5umGFu9Zs+CwovyleRenng+H
	Zm/mih7FSV16O/6zGD0yaqfizl2LcuUYTRefKYynbhid89wWxy8Y+mBGxHvRszB1hIJaeEloSfZyo
	Xk9U0lcA==;
Received: from ip6-localhost ([::1]:20686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rJFHf-0002Et-Nj; Fri, 29 Dec 2023 16:00:26 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:43228) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rJFHb-0002Ek-73
 for samba-technical@lists.samba.org; Fri, 29 Dec 2023 16:00:24 +0000
Message-ID: <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1703864593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NKz/uc+BSnXfJrlFDCo1YHpsQp75sUcISpy4NlnEtuA=;
 b=eES9z8qbXMeYiiB5Fz/+Ihl5XgKZs42QGVXU4Qr0ywEV57h1hDLQvOahAkEydG0cUYYywp
 BjCldiSJ29k4YK2i2XJcc4pOcgFP8sOpfgWQfDt50nF3UczbbKUIwDfXxTV1smW6qRLLxW
 M2WGOvHWicTxOjgVQYqB+UpkGdtexRf7SWfrleG/4hj3x/1XZUHt7HCwyamiy1GL3ShJxj
 pM3atdQmwzo7FIdTme5wPBkdxCs/DLbHEOa5seXq7dn3StbIiym2G2L1tNW6cMu0r/aiIL
 5twwRSHWlTjoASnbiT/WOsUZP0oHdr4Xb49xwIVr39iZ0d4Z3/bNnz54Xl7LTA==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1703864593; a=rsa-sha256; cv=none;
 b=PKT5kXBeGKXpAx4CUfnzMaeX0wigxogwo6MQJ7wibOW6y7YviA2h0APAf43eOH1P3c6Oq+
 L7WjtkojU/VzNrO/VdCY1oWEQ7k4vD+nOPiefYKQ9lKIBGEteC5fqgfSKNrQmzVPZ9Bcsb
 de6KNKsNsl9yciD1koiPoyl0v3ghBKfDo4yOcWRw/4vEIjXWjk27Q9I5TLr6eAnWW42GSV
 letB7u8GgoTe8gjl5BNw2Bm1txKdPNSrJFa/TCorVEa7P7AAPgcR8q2GLwu0mIXGs2hcGB
 dTo9heqkwEViVJo0ERMUgn+/KeTWpzEN6KKlMRblc27h81tqsFbqJhkIMMgyOg==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1703864593;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKz/uc+BSnXfJrlFDCo1YHpsQp75sUcISpy4NlnEtuA=;
 b=Gei/jY/BMffoCYBaThPd25cCS90C7fi/VK4mVvdiDSz9ls9rb/i7ghB9fR+QPuIujnF0BQ
 /MOGUOP+x/ySESP2hftPUxVUWeXOHHYaO99lbobLv8naB4vl0yYZrGWpeGnL64HmyxBUz1
 +vo17HbXifDzxrF2FQV878Tr+tDp+L36QTx+WO2i5hflRXymgiIDQayaOrL6Q7QtnDpW/7
 hv2FNdfNJKjLFmbXPel7w85D90yX38M/ydKqZgBc/blf7qaziyizMQt+AurFwVVPXzF+Wl
 lw7qZvYFpY5R2VRbBNDN43er+fl3ksZ0iEAn0ePTZYaghwoxaNc4Vo7lE9KX1g==
To: meetakshisetiyaoss@gmail.com, sfrench@samba.org, lsahlber@redhat.com,
 sprasad@microsoft.com, tom@talpey.com, linux-cifs@vger.kernel.org,
 nspmangalore@gmail.com, bharathsm.hsk@gmail.com,
 samba-technical@lists.samba.org
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
In-Reply-To: <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
Date: Fri, 29 Dec 2023 12:43:08 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Meetakshi Setiya <msetiya@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

meetakshisetiyaoss@gmail.com writes:

> From: Meetakshi Setiya <msetiya@microsoft.com>
>
> There is a shortcoming in the current implementation of the file
> lease mechanism exposed when the lease keys were attempted to be reused
> for unlink, rename and set_path_size operations for a client. As per
> MS-SMB2, lease keys are associated with the file name. Linux cifs client
> maintains lease keys with the inode. If the file has any hardlinks,
> it is possible that the lease for a file be wrongly reused for an
> operation on the hardlink or vice versa. In these cases, the mentioned
> compound operations fail with STATUS_INVALID_PARAMETER.
> This patch adds a fallback to the old mechanism of not sending any
> lease with these compound operations if the request with lease key fails
> with STATUS_INVALID_PARAMETER. Resending the same request without lease
> key should not hurt any functionality, but might impact performance
> especially in cases where the error is not because of the usage of wrong
> lease key and we might end up doing an extra roundtrip.

What's the problem with checking ->i_nlink to decide whether reusing
lease key?

