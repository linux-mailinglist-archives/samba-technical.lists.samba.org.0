Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E711136D2A5
	for <lists+samba-technical@lfdr.de>; Wed, 28 Apr 2021 08:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=RdRxjjCTJkQCldPBMSXjIWhsh2vFrvGwjFz56+RbQw0=; b=HqBi4b3r+bHWJZE60Do6LNBhFj
	w/m1dEY2daqfHca9ya2IdLkhXnRyi7qtZ35qwHeiJYenReMmNdIl6hf7y1khfx5iNijpZhXVPkC9N
	0Bv9jIvz6MWFt+wz6zq/tUm9C6ngCtZMk6WJhw9v1Pf2Vc/lefH8692CujgC/uzEqwhqXBuV/6YQr
	IDpIxTzmLY+Mt2UCLEXvSEvWNYOyGKJVayDx8auwTSI72iSEbmKoyosGLm53hTrQZ5Ivk6xNDgOvG
	OVqCsDzA3+B0bXvhohH53PHPhWj1ol5q9isp2s1Ww9o9oAbju9lH1+mDX9ninEBlMfo15Hb3wX8BS
	pcBa14WQ==;
Received: from ip6-localhost ([::1]:50806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbe7Y-00CmqI-Sy; Wed, 28 Apr 2021 06:56:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43636) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbe7C-00CmqB-Ss
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 06:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=RdRxjjCTJkQCldPBMSXjIWhsh2vFrvGwjFz56+RbQw0=; b=NUkaTDdPxuLkTSG8wZDjKjBRQ7
 BlH03hcmMc0cR07p3HvybYVjW0Ueb90q9KUyv7tZ1+aOM6ywQd0AlKdWnBoffmQkmgQKF4009txk/
 ziO5TRShvsMKkHjvqHwivN4KB0H1FkKWbLuoYX2+gy2ZE+vw/tZIcotUnvX8bANI/hsyCbn+pqAcM
 b1fRv3LlcPjpXhyDiVVwBN8ANUhUUA/P5qk1sGTekI5y0X1bnmcOwsSvGq2owfzqnEGoC96k1ePiw
 w5pTBRs3MidwI15rQbwdl0+uJxQniGLcpQo1qB5Da3LlFK4obhDNmD5gOT9Aormz31B/qlqDhhznf
 Dji2Os43etOGEFOjXDtrzZAzCfN2+Nct1aAp+REvQXmFgrUPCVFgpGuDA7dwSRYokPjAu4WIWLGDa
 CvZjx2dV+/st6rsU8mJHOTDlS+4oSDbpZS6+ZabfI7uZT595Tm1fzBBkrEhxxRPzjtCWbKP5PtT6d
 ZguU3DiNROSeP4f3N7lpIzcF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbe78-0005CC-GX; Wed, 28 Apr 2021 06:56:03 +0000
Subject: Re: WHATSNEW: Document removal of NIS support
To: Andreas Schneider <asn@cryptomilk.org>
References: <1909015.IJMpmFZxnm@magrathea>
Organization: Samba Team
Message-ID: <f0526f1d-a6a8-f9e4-c3b7-2b5ee78e4cdb@samba.org>
Date: Wed, 28 Apr 2021 08:56:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1909015.IJMpmFZxnm@magrathea>
Content-Type: text/plain; charset=windows-1252
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

Am 27.04.21 um 15:00 schrieb Andreas Schneider:
> Hi Karolin,
> 
> attached is a WHATSNEW.txt change to document the removal of NIS support.

pushed to autobuild-master.

Thanks!

Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

