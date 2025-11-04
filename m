Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E6C3063C
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 11:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=PkC78fye8y2BMBcU8MvAn/E/MmvJG7eMOQo1+RUmnSI=; b=Y4dw1NNnnk8IWlbVlypYpZJUmh
	BF5qcoDTCxHl3hF7Of24wyWytKH72aPwVzjAEELbcPuGKtNETbpzG0H1J7DVyKupI+lkw5B0fq2HG
	CAA4MaSf/es+4Bobf7/qls3ghskNp14Hj7DWrWg8M6Rce747Qi834Z+k/QYVco+XcX/tnuvrqreR4
	Z0RdPtPNLA2c2wyLOnMGRZxJKSJ86HDTTSl+oxbNrrsnsvu8vsl1gWX7TjGCcEUiblHeEwQ44zl+M
	fTYdrHm+g5BQ5xsClMZwskGZiwfR22/Z8viNJdbz8w9PC9giBAqCpcNftnsc0SMfIPnn9s9HRn0sn
	UIj0mm+w==;
Received: from ip6-localhost ([::1]:28580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGDpW-00BRjA-UG; Tue, 04 Nov 2025 09:59:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34586) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGDpR-00BRj3-Ui
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 09:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=PkC78fye8y2BMBcU8MvAn/E/MmvJG7eMOQo1+RUmnSI=; b=R2QlKyVtmDJiHR6T62gs44Vvwr
 Oaw9AKckb+Ar7EyAKGNiX1ov6cL8PMS5OtxXMoDbIIx5KmoQQe6opuOUM81/i2oOEdOb3ttFvPTVI
 CPDwdU3liatUqy40SL8jbkXWZLEKBAnTRkWy/FJPDpHgKGLxg5p2sYv7kNhi/92us2ZAhwMZnUBil
 1sFKkD4iCT3euGoFE2AIPMSJGIfukUcj4j9Ar4C+dRc+WjrWHKuX7L9mcq1BFJCKcd85DzrFEmEBS
 T1isaMPtLbWjUAv/PfBOJUWFs9YTxOo4yBYNNCXNGlrpMfcQTvCHUzcSV7Qbu4lM3nx2ug0Gjywep
 G5Wgy6YEC3BlgJ5rOAfTwpl52G9//gQhR9UYybYWcH9h3KGGxgUvzxBciQN+opsS9wnYa/HS1iEUj
 WTjRpN63/2zuzPZx8iZvE5lH3rx8jHXU4Lzz+39c3mdRE8vf3Tr6KzVpzjJ7uFaxv2gBMGkkDLTlF
 /4lVHjm8cmp7VHnQ5FSqHbmi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGDpR-00CVYD-00; Tue, 04 Nov 2025 09:59:53 +0000
To: samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>
Subject: Re: Top 20 developers with open Merge Requests
Date: Tue, 04 Nov 2025 10:59:52 +0100
Message-ID: <11918736.eNJFYEL58v@magrathea>
In-Reply-To: <657cef07-c75c-43cb-99d7-78e7ee9bf955@samba.org>
References: <7684109.rdbgypaU67@magrathea>
 <657cef07-c75c-43cb-99d7-78e7ee9bf955@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 4 November 2025 10:52:16 Central European Standard Time Stefan=
=20
Metzmacher wrote:
> Hi Andreas,
>=20
> > together with Claude I wrote a little python script:
> >=20
> > python3 /home/asn/junk/gitlab_mr_counter.py --top 20
> > Fetching merge requests from samba-team/samba...
> >=20
> >    Fetched page 1 (100 MRs)...
> >    Fetched page 2 (100 MRs)...
> >    Fetched page 3 (21 MRs)...
> >=20
> > Total open merge requests fetched: 221
>=20
> Is there a --no-draft or --only-draft option?

Let me chat with Claude if that's feasible ... ;-)





python3 /home/asn/junk/gitlab_mr_counter.py --top 10 --only-draft
=46etching merge requests from samba-team/samba...
  Fetched page 1 (100 MRs)...
  Fetched page 2 (100 MRs)...
  Fetched page 3 (21 MRs)...
Total open merge requests fetched: 221

=46iltering: showing only draft MRs (96 found)


Showing top 10 of 46 developers:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| Developer         | Open MRs |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| David Mulder      |       10 |
| Stefan Metzmacher |        9 |
| Ralph B=C3=B6hme       |        7 |
| Andrew Bartlett   |        6 |
| Andrew Walker     |        5 |
| Bj=C3=B6rn Jacke       |        4 |
| Jennifer Sutton   |        4 |
| Andreas Schneider |        3 |
| G=C3=BCnther Deschner  |        3 |
| Peter Eriksson    |        3 |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| SUBTOTAL (Top 10) |       54 |
| TOTAL (All 46)    |       96 |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D



python3 /home/asn/junk/gitlab_mr_counter.py --top 10 --no-draft =20
=46etching merge requests from samba-team/samba...
  Fetched page 1 (100 MRs)...
  Fetched page 2 (100 MRs)...
  Fetched page 3 (21 MRs)...
Total open merge requests fetched: 221

=46iltering: excluding draft MRs (125 non-draft found)


Showing top 10 of 58 developers:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| Developer         | Open MRs |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| David Mulder      |       15 |
| Andrew Walker     |       11 |
| Noel Power        |       11 |
| Jennifer Sutton   |        6 |
| amit kumar        |        5 |
| Alexander Klishin |        4 |
| Bj=C3=B6rn Jacke       |        4 |
| Andreas Schneider |        3 |
| Andr=C3=A9as Leroux    |        3 |
| Oleg Kravtsov     |        3 |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| SUBTOTAL (Top 10) |       65 |
| TOTAL (All 58)    |      125 |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D


You can find the script here:

https://cpaste.org/?
b40178f9141984f6#HicYpxw1yVFN2AM6HBx6pMQJpgB7HmJpGB83kfD89Kzm


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



