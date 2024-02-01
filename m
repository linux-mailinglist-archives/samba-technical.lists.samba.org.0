Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B86F84612D
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 20:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=6v8+Ffejm93a6lU7G/bMYHA4n/6J8ERCmsEKEd29aD8=; b=Ult0ll4q0+3RSn7UZy0cxmQGdx
	57AqhGP51mRTNZAAg3mnjyFESyStK7MFcqI+c3CefGDofLBu0EqHzZDqw1T2zb9BbU56LZXVfNzWb
	GLHlZcy5dM9RO7Z6zyc0QMkYUybDS4sDRQrCSnc0pSXlaGqWwG8FDlCZWyHFq7uRk91IZ5e7tc74V
	fMjE6VIMRAnbucsSF0mIWYGBOIUWIXXw+Kyt6m/adfqZB+mDHSYrwN/k0OCcwgt16NpjWoXGBUQ1+
	Ki65PrdziqJNFc5Gwd+P582hCdkIgNDqTaeKK27b81Ci4rJ44bQ3WWuxVrPzuqrRf5CQz9lffbkd5
	9MRUZ1iA==;
Received: from ip6-localhost ([::1]:25528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVcx6-007Idj-Kj; Thu, 01 Feb 2024 19:42:24 +0000
Received: from mrkos.uberspace.de ([185.26.156.186]:46734) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rVcx1-007Ida-TD
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 19:42:21 +0000
Received: (qmail 27498 invoked by uid 990); 1 Feb 2024 19:41:16 -0000
Authentication-Results: mrkos.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by mrkos.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Thu, 01 Feb 2024 20:41:16 +0100
Date: Thu, 01 Feb 2024 20:41:14 +0100
To: Steve French <smfrench@gmail.com>, samba-technical@lists.samba.org
Subject: Re: State of unix extensions and symlink support
User-Agent: K-9 Mail for Android
In-Reply-To: <CAH2r5muS+w+pv-32pYhui7yyvitdmCgbkfZdmbTyo3ffOHKpqA@mail.gmail.com>
References: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
 <CAH2r5muS+w+pv-32pYhui7yyvitdmCgbkfZdmbTyo3ffOHKpqA@mail.gmail.com>
Message-ID: <B3566794-B5EE-48C7-AEF4-EC9E9477ADA4@lrose.de>
MIME-Version: 1.0
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.329295) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.429295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lrose.de; s=uberspace;
 h=from; bh=IzLGhoga0WLZIf/whs1o1n3paTE022AeMqWLcLUA3ug=;
 b=ePYB7XY3rWiiqCA4O+ZfyuINwoOlLs3EaFqJguwhV7n9R0Ex121RLyMUd9Ri8DF2MmUD5u064+
 3uIjBmLofUWtf45kjGOKgzGuzIK99SGbi9MkilBCLDEX86+wQwHRKsyTY5C/OYa4d7nvBY0OLK38
 xxgyr8CNZ7PJQ1txfFLOTfuVo7OUm1wdfK1uSuBs9TPFqHAObDWGrY8TIisbnSc33djorCT4c8C6
 HTTMPQ10WYMMNxpPsnwqQ0RQfoSfwuM1JBnvRAWcBO7s/pasMgzyWXslDSo2nVQtiKLcyeVXiCZb
 BKQBKmJLIHSPrBw/he1qX2cH/0QtMfHNfLHjaGBspGqc1HNxFEiqFTR0Wp3wW7fhIM21/G1D52MM
 3DHDxFzxhcq5Tt6SrzX2Q5t7OBpfIEiaUtnIzcSZ5kKhkE98gVdViUhPz+IsS4OLRLUkbfK3jx2+
 xemfUSfCWgTN6iQMsMn/ge8k/8g6QQsvtxsOEs4Ct6miB1UCa0aKsOpi8BJI8Kh+Nh8O0wKTcYTO
 ybkWwxtbZN7K70aVrCy55bg+VF/5p8jkb+HBVYHwLiTrFRFim+EoWWqevAIOllCyDmm1VGcoNPLV
 MJhkkpAd+foIQoXwBEZOq2jOFEtmsH290uW6YiPjNBoFtKLap6Ep1fxoCfDffwFYHWoNgmo1rvAP
 A=
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
From: lukaro via samba-technical <samba-technical@lists.samba.org>
Reply-To: lukaro <lists@lrose.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

You're right, mfsymlinks is a workaround, but I need the symlinks to be sym=
links on the Server as well=2E What are reparse points, can they be used on=
 Linux servers? Or are the SMB 3=2E1=2E1 Unix extensions somehow useable wi=
thout having to switch to a developer version?
