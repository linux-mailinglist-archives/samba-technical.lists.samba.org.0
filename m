Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A785E56E72
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 18:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7ylFS9sKdZgKVLzaONgYJ+CATCFOqB2cQWR2lXz6DKg=; b=C/usekihVwS6lQMeiHEzTIRnuU
	ksoHNlZeDxHTaFP/Q3uKz4E4Vr7b39XUe4zn9pHJBuJKz7PfAq15/VRcj7gxjhFZu32ulBNF2Mss4
	CPz0i/gsuVWa8ZNAAabGup40rgkBEUd3D/+JajFr5QE1fuECBqzQseZ1Gehqyinskd1m0ViRqAuU+
	7dgfThGicjWGqZqrbhufrPjwACVYF+v4N5OrniFVX/WLSh9caXPDCvtagSk6BG0EoE9YPicYOrmZl
	P0cF9ygScqyro4tK09AEiQcFM28ZI7U6cSVHfAkX1j5B1IHPVEr+2cUcVlIZ6kZ7HPNGeQLa2s6TV
	BPeSzQ7Q==;
Received: from localhost ([::1]:43268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgAXK-001waz-C9; Wed, 26 Jun 2019 16:12:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37038) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgAXF-001was-Od
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 16:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=7ylFS9sKdZgKVLzaONgYJ+CATCFOqB2cQWR2lXz6DKg=; b=CvCDn0wHOsvm95U0NT/DUWTcyv
 1XnlMYhhDvO8zCRELm9+0hmzSKL5zkV17Mo2y7gyVXu35Hcvbdvi9kpbAe0B3pqlKnpvsIIHc0rBo
 GCW5tVi9ViiMPkWDSre5ySxKK7tf7BEu+lLf2NMeW423WNtQnl6xCMcHNTms9IpqYwi8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgAXE-0002Q5-LL; Wed, 26 Jun 2019 16:12:36 +0000
Date: Wed, 26 Jun 2019 18:12:33 +0200
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
Message-ID: <20190626181233.4fc61c42@samba.org>
In-Reply-To: <20190626135745.lk7757wmy26pgy26@inti>
References: <20190626135745.lk7757wmy26pgy26@inti>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 26 Jun 2019 15:57:46 +0200, Ralph Boehme via samba-technical wrote:

> Questions? Remarks? Thoughts?

Thanks for the write-up, Ralph. I have a few of questions:
- how will this change be affected by filesystems with low resolution
  birth times?
- given that this issue is Apple client specific, is there a need for
  this new logic to be implemented outside of vfs_fruit?
- what should we do for snapshots, which may have identical btime (and
  inode) values shared with the snapshot source?

Cheers, David

