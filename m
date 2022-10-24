Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CA860BC12
	for <lists+samba-technical@lfdr.de>; Mon, 24 Oct 2022 23:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=zquQZiNLQSPWJk4YalzVJq/OKT5BLuZUkqlobtvCjP8=; b=wRfYaGQtAKIcpPsQ6aCSe/UEIt
	D09ZzHusxknOG3jVMT8SPwSq47askGVtbxFwAPwFO0m6uaOknfqDTIxOpJJDDK8YRk5Y+ev+1ltgk
	e4Lc9jBMAV2M5K/8kRThpWAttykzKPAUHOqDOEoh7HvIbMTKZDmV2NnlhwoCFBZEK1prC28A9gYQh
	8b/T7iKeeEI81x80DxdLh0flgtOpypiooc39VmbIR6o+uE5SMUYIbSsRuLVPwTiwPbKMBnXhUFFu2
	H0PAvQ6qa88cicvSJa5DWYFnP8bpMYH/1oJ3Q+9xRi8nwzwKarlAnqn3aRJy4qNGY6ua1U9sxN+35
	zj6QlQzQ==;
Received: from ip6-localhost ([::1]:31872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1on4vx-005ZRp-Ev; Mon, 24 Oct 2022 21:24:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1on4vn-005ZRg-0m
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 21:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=zquQZiNLQSPWJk4YalzVJq/OKT5BLuZUkqlobtvCjP8=; b=HV3LwR+W4NBIBlyjL01mMPtUSD
 3ggXKu1sYqByccV+q2xfYaiZHxXnKX4l0BXVXU+O7u9nh5nw8XAH8+HFzHGr7DXf/mB6zIT5ddD6W
 D82t0rr43a+0vPxvVnOu2oTtD7VyQqVcagh674eZ4qf0oy5LrQo8QLsyR3oIhZl3KB49P/DgMOfv9
 4iMcPobYitbBP4b/YzTP41q91TKp795GwkS5WC0+k2ZRD9jOv188Vgz01yL39EtVV3oe5ePN77wk/
 nkd406rxZtfwDb+x1mSv42f9a0vF5UsL4ZeU3NRXBN+jga2GmABtKJ76EXWoTzQJBq9lUDKGdwP7F
 nFuimrnkz2YxJb+GT5djNuJO+RJTWG8qwRewrZ6xUi8QDmGBvj5dOA6xdmf6nJ7xujF0p2tx1TWxL
 KSSldGHi3K5wXoMjPQcRcF1c9BY3gBeB3ZMlKtdmsOuO1hR0J+xDXSijZ3ObpyrvbT+0ph0Ns9ZoL
 Luf1S6JQ8RU8+uEUrIWv0ZGy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1on4vl-005aOL-H8; Mon, 24 Oct 2022 21:24:22 +0000
Message-ID: <fb434777e5cf9c369de54b4c47b894c162ce91b6.camel@samba.org>
Subject: Could we move to GnuTLS 3.7 minimum and Ubuntu 22.04 as our primary
 testing distribution?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 25 Oct 2022 10:24:17 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: asn@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It is a bit of work, but I think it would be very worthwhile to upgrade
to Ubuntu 22.04 (replacing Ubuntu 18.04) and GnuTLS 3.6.13 as our
minimum requirements.

We would also need to update OpenSUSE Leap 15.3 to OpenSUSE Leap 15.4
as like Ubuntu 18.04 it doesn't have the package. 

For CentOS 7, we are already pulling GnutTLS 3.6.16 from an appstream
repo it seems.

This would allow us to remove the last of the in-tree AES code,  as
well as automatically test the new PBKDF2 based password change code in
SAMR. 

This came up because this MR:
https://gitlab.com/samba-team/samba/-/merge_requests/2753
is not automatically tested as it is behind an #ifdef not triggered on
Ubuntu 18.04

What do folks think? 

Andrew Bartlett
--
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source 
Solutions






