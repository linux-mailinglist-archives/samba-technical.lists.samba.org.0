Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21A428C51
	for <lists+samba-technical@lfdr.de>; Mon, 11 Oct 2021 13:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=GmnI95LqAXywHtdtY0cG8QmlQsKmY2ZmuZg4Gdmtzfo=; b=cPe2nwT11gZ5p0tHlQIblRGnEK
	zdJ7nT4Wk4SByybRIg5E1dRuwsbApcjOBSC9xR4CfZoiL5hrnocBfLjvHDpoCHkbrc3uL44kjrp/a
	aw5kWNJDJkQ1euUmkWlbEWZRsS5phOjNuds/HYAO5YP25zvnE2kYUXWgViUQ6qx/Uv7q2NrktG3Kv
	vfisDlFA9aIARk2omZCzRSxgbnHyiJoLLCGERldsW1DdL7NrfM2BtXcM0lKQC2AuIiajVjJuZsD9R
	MAy0Fy2heYxlFXkeH7lNVZe9awCpjy4Qv0G2l3TOh9tWAo604OQelt18amjfFbqYzZqVBIoZ1R1on
	c7kNlE/w==;
Received: from ip6-localhost ([::1]:35954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mZtl4-005zh5-8s; Mon, 11 Oct 2021 11:46:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56282) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mZtkz-005zgw-5Q
 for samba-technical@lists.samba.org; Mon, 11 Oct 2021 11:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=9sCFUs+GSZFfvXRTpcES1NtHrmj6+lYCqpzD9JhCwfY=; b=3P31yBjB+FDUlS3R2nYO1UYlup
 DPjeoBqXYXkBVENnnlqnZ9ItefulmgJPQIC6Nqux81HA/+6zy+jaZcRGftpZnP2cYAPfX3vnfxvqN
 nb8czOq1uMzdffLguHNxezS091mVQ3uj7qTLbsk//+aTFoGd2DABrTCUXtU+UKcbVyFbStK2QtsWM
 pA88/oStaUe4WU64A6v9CSYCHYLg8nie+CQh4uc+aJwGFuU9943B3Zpckg5JixdlFn1/uIm92rAnv
 TDjK9c2e4X3EHp8lYCuN1b5lnSu2YuAzcJYD4tKI/05rfAaSFKfM53rfSw8oqreu/r4HFJi2QgF8r
 s2hhyrHY1/w68VAbsZUSaxED7QY+1saZxB7ozlYSGvPsq7DpzBrNj+HxMghEzCRJkLfgoHiM3tuU1
 dzJXmzxBnpTmwXlHYUifWhHxQAOrfQSIMVa/ChQWlH1rT/3TXAqcslCaPeHz6fLMFOjS8Xdw7Lnma
 vVNdSuT6ZN+2zwoAh822godp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mZtky-000k8b-Jj
 for samba-technical@lists.samba.org; Mon, 11 Oct 2021 11:46:12 +0000
Subject: [Release Planning 4.15] Samba 4.15.1
To: samba-technical@lists.samba.org
Message-ID: <9d8bca74-2d84-cfc3-90b7-d5e9907392c8@samba.org>
Date: Mon, 11 Oct 2021 13:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset=utf-8; format=flowed
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

the 4.15.1 release will be brought forward to Wednesday, October 27.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.

Cheers,
Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de

