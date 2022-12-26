Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD37B656622
	for <lists+samba-technical@lfdr.de>; Tue, 27 Dec 2022 00:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9PlZIUCUCO+InQo8Bd1LygDZkLvZOOzooAboSit6rkk=; b=Ow+RbRp2qnuIpoDD6uPRrAZHqL
	Eg6SIsggkEyISa4IWbplu4y/acZBaYDu3s3AvJXOlTRh56BI5LyKKiZReiITaqeS9hkyJYnPwoFc1
	iRQgpvMfu01TDx0aPGupxUWpOgtnGh68ucanwmpE7WIyttSn6Z4YWhR9mHW1sOkWucZv20rAskgpK
	ncSpf+s80fsfk9LOebPlLSPy5AyEAuaiZfmesANcF+jQW1jF+2v2K+T16Fc4jsysFUO727vxGy8pi
	/lPVTcIQrwNp1M1FRlVB6JvY4XAMm+9hqfiTALmMLdpOjL3C4OBHLiO/yaNgmCjz6b7B4ee3x1i1F
	5nd+dwlQ==;
Received: from ip6-localhost ([::1]:43240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p9xCl-00BWGT-Hg; Mon, 26 Dec 2022 23:48:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p9xCf-00BWGK-96
 for samba-technical@lists.samba.org; Mon, 26 Dec 2022 23:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=9PlZIUCUCO+InQo8Bd1LygDZkLvZOOzooAboSit6rkk=; b=O2uLKFmFerZxZpiHHhqMxRGCr5
 wWjd97cJ4CXXlxaudOcpfPYEEEYAH3YULgGYmbDVyk3iT3ayHgxo3B4weoBoB6fpV6UNK9CmVNUp1
 ZEPurxwrAqMOs+i8yvie9nzSxwBUmdxwbxv4DehwaJFrWN6NImghRFETRgXv7RaX6D13EiWbp5yAu
 KvbUH1YJHg3fbE581DOd8sON5S3xCYN0GfiN5L1ciiBVQnAa1IKNdgmLH/l5LGDHFop+MZYhae5qk
 SOLidOFlfE+3pmiJdu/p0ujewKEpIFey7I9BuRwn16YIxsuFUknpC59kpKVoMWZRE70RDSdjWBuHZ
 I8iBRrOKntY+gYhPfG/7V6eAAxgRBPAuVUxN6ph6DL4Ylw9qqDpi8tB5Cf7qhy7x1YNS5ZExio/OZ
 bA+pv8rqyHj/ovWPMIAhpfPiih6BkJJUt2yZ7XsZmNdwFIbpRrNp9Wa8LD/XIMP+mKaWya7kq5xIF
 ubbeDIkVBVocHnJBrJpHYN3b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1p9xCY-005ZBn-Up; Mon, 26 Dec 2022 23:48:15 +0000
Date: Mon, 26 Dec 2022 15:48:12 -0800
To: Dachshund Digital <dachshund-digital@dc.rr.com>
Subject: Re: [Samba] What is the correct process or procedure to add
 functionality to Samba?
Message-ID: <Y6oyvGgAtTMclIqK@jeremy-acer>
References: <0614cfc6-0095-0f36-764a-52f1751fd774@dc.rr.com>
 <Y6kx2nCjLTAcuFOM@jeremy-acer>
 <145f90b4-4494-396d-112f-88a79e032305@dc.rr.com>
 <Y6nuzr8e+aqloMQP@jeremy-acer>
 <b9da39e4-824a-b0a0-3a31-caf38b0bc8a8@dc.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b9da39e4-824a-b0a0-3a31-caf38b0bc8a8@dc.rr.com>
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

On Mon, Dec 26, 2022 at 03:23:10PM -0800, Dachshund Digital wrote:
>The issue is we don't use AD, and it was or has been a serer-side mind 
>set for this type of control.  Not workstation side.  To change things 
>per workstation has its own set of issues.  If we could use GPOs or 
>using AD that would be one thing, but we are not and cannot.  So 
>really need a server side implementation for our use case.

Registry shares are a Samba server-side-implementation.

https://wiki.samba.org/index.php/Registry_Configuration

