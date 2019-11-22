Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A959D107811
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 20:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EEtTRMlWBqlpCzLFtyEAHulSQXxm0ci2ZqsKkxPsS84=; b=VeDP3CB95+LssMJbsE4h6mI6Rq
	AyhuD03il23pG4AsEpN6V4BE6CVAEXPbIcvA14BvbbAvrm6NheInWgxZqHlxMz4M/XpBO68o8hapa
	wlTNsPVa7jvNzP2qNjv+/L6dpKSUM9ZjVqMHfgzsAaMau/0rBxnC7eY6PSqSGEsl7/Nn46piiGvKl
	v25hTvYkjgzusnxv686p586x0+iFk+FYoTlA4IkRE+8HgEyxMkpCa79iZ02Z/2Cmpvp3SmBOpsPrV
	eEAuj8IKhMYrBksG0M40PWmHAgUbPpcTuFf/UJ5syi/XGb+43sjEvxtp/7HWh7QvGqnh/lvqKppcA
	noPNN1nA==;
Received: from localhost ([::1]:56258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iYEix-002944-Cf; Fri, 22 Nov 2019 19:36:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29146) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYEis-00293t-VH; Fri, 22 Nov 2019 19:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=EEtTRMlWBqlpCzLFtyEAHulSQXxm0ci2ZqsKkxPsS84=; b=LDMpSossHzPSqcnQxU8yLzqdWG
 EFLkP6x8A17roFfSUqSYCSZc89ZvmvaYmhs18bfam3pR4U6Nr4i+pIfkgAMvIdA3e350DCCh9ZV/i
 Ly+lTNEhZmvP7rgVQt+Ax6Yu4DdMVsbJLXTZgYdz9NBeRpaVtSKtqVy5h1xt/2Y5a5S3XNhxNVv2Q
 fxH67V3U4tig34huWc7UVfHQE+6TwRqnv+7ve25eZPl3//euZGTY6w+A/+QxsmNkixNO01Av0WF6G
 dLit0EtXX6BVYtsMVdcSDd0FjB9b6wPj5wawx3L8qbGza0bepTfyIzKuaUP79AIffmuPquWjldXHU
 uylkA/eymIWH6khv/s3sUrprXpvFZ+GaSspXnPBRkO6daekfrehF9cZS5aMiLurUCiDvTDE0XWBqS
 kkAH74h9/QGMJlt9rw8UWRyCgS9NWAZR+Axr2CZXfKqZkhYM4big6eq02t1ivcLBmp+BslBoWsBSA
 42WuJ5dp8CrJ6Xi51KmedP3N;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYEis-0007la-9E; Fri, 22 Nov 2019 19:36:06 +0000
Date: Fri, 22 Nov 2019 11:35:48 -0800
To: samba-technical@lists.samba.org
Subject: Vault 2020 Conference call for papers.
Message-ID: <20191122193548.GA12731@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all Samba-folks,

The Linux Storage conference Vault '20 is open
for papers. They've explicitly requested Samba / SMB
papers.

Website is here:

https://www.usenix.org/conference/vault20/call-for-participation

and the conference is February 24–25, 2020, in Santa Clara, CA,
USA, at the Hyatt Regency Santa Clara.

Local to me at any rate :-).

Any Samba people wanting to attend / submit talks
are encouraged to do so. Call for papers has been
extended to December 3rd.

Cheers,

	Jeremy.

