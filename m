Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533A4AA71
	for <lists+samba-technical@lfdr.de>; Tue, 18 Jun 2019 20:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=oPgm5l7iNaoDNyp3WV9TJt6erF1neM0Aa54jBs1E40o=; b=cDRbZ/BpHM1UDkx+sY3dxV5voL
	Z2YoiEiykpSxzlFuN9eS40oRjaSKPAW3E4olR+k9ZS8TmvUWp+XtDDXWdGPnuJ3/siQARJHKP4VPK
	6i3YWLxj8b50JVrvptuSHgedH0DP1OP1D8dUd8OTjyTsEIpfo51ihO+MjEISWndOHqlMcHWUBFHEi
	Ov1LleUXIxNSrD37K95WibkhjwP5mn3wAiQ/5yBk3la04YRWDcgkJX5qyacPwpuNntPWm3fuz+bsq
	SEslViLPwlbctId1aVKJg1yfV+DyMzAhdCI7bfUFK4bcR7Yfv36ZTKZVrz1y3nUAWI/XEQS5ZTcyN
	YwF0lAGQ==;
Received: from localhost ([::1]:60324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdJHJ-00086X-0d; Tue, 18 Jun 2019 18:56:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38490) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdJHF-00086Q-GX
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 18:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=oPgm5l7iNaoDNyp3WV9TJt6erF1neM0Aa54jBs1E40o=; b=slrKBDP+eqXzYpgiuf20iRRKx6
 kCUpg+nZG+K3/G4FPiW0whtRYggsiUJhXxXU9qYS6Seds66la20YWrKtvhZXm/Y/S3d65TT7dybO3
 V4BKezIlN+izaERQsG1q5i2sHrIa/acmS8I8KMQqD25E0Kd2i4zAmQy5FfMo5s7FGc40=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hdJHE-0005Ya-OL
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 18:56:17 +0000
Date: Tue, 18 Jun 2019 11:56:13 -0700
To: samba-technical@lists.samba.org
Subject: Re: RFC: deprecate allocation roundup size
Message-ID: <20190618185613.GA20367@samba.org>
References: <20190618144358.GA6800@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190618144358.GA6800@sernet.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 18, 2019 at 04:43:58PM +0200, Björn JACKE via samba-technical wrote:
> Hi,
> 
> I was debugging a problem with strict allocate = yes and our current default of
> "allocation roundup size", which is 1MB. While I understand that a large
> allocation roundup size was supposed to the a performance tuning for old SMB1
> clients, this has the side effect that with "strict allocate = yes" this makes
> even small files take at least 1MB on the disk, because smbd allocates that
> ammount of disk space which is given back by smb_roundup. This is an issue for
> some setups, because the extra ammount of needed disk space can be huge
> actually.
> 
> To work around the issue, I tested to remove the smb_roundup in places wherere
> disk space allocation is being done so that the allocation roundup size value
> is only used to announce this 1MB "block size" to the clients. I'm not sure if
> there can be other negative side effect thought if we announce that large block
> size but behave with the actual space allocation with out normal small block
> size.
> 
> As this performance trick is not needed for modern SMB clients any more, it
> might also be be better idea to just reset the value of "allocation roundup
> size" to 4k again, deprecate the option and remove it with one of the next
> releases completely to behave more windows standard conforming and to just cut
> off this source of irritation.

+1

I ran into the same problem. As this seems to be not necessary any more,
deprecating it and removing it later seems sensible.

Why are you proposing setting the default to 4k? We could just flag the
parameter as deprecated and change the default to 0 and then remove it
in a later release.

Christof

