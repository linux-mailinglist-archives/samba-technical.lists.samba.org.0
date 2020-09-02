Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A537925A2EA
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 04:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Tk6bJ9hLGHjACCe8mN3g19EOPrW/09Sye+AjFYPiwBk=; b=hJCmAn5xD1WG0L8ZEU8H8YdU+Q
	Os1zUIcF7kDUDDMoKjiu1ECqEiHcIZpDS+qENdiCAhgo2SgtiZuq4hgev6Qt1XI4/dRksBjwT5rO0
	2UtmRxlt9T0ynEzAZ38nZt5RvZEwOof6B/nv3Y+IC3XBznYsczeAjoqnuVBTehKbyoadUJft00Niq
	BaYGs/woIudRi9qK2Ji+yvbrXpP9DY07RmF0/RH/Oo+KBpuGQ/cn2tIc9fj7snx2GfZtDt2yIbW61
	J1nDMu3IzguTuOOed2FDjFHfI4oe7EPV2l2RQ6TDF0GHCxuvH7nTbcekMLNozJK+wN8g2Bgo0PIkF
	RsI3coAA==;
Received: from localhost ([::1]:31548 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDIF7-003S9G-8B; Wed, 02 Sep 2020 02:11:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDIF0-003S8w-ID
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=7aE5s5wBpmMEbydD4yOTUsAJm8bKsbgEnuBoU6HuVYA=; b=e7XGWSQyzO9x/rJnhVX/4xIU2y
 OLp7oXBDafKYrjYSbQWohhLq/3eVncD6oRTPBuKzMuvAupHZZNPVPeWXVJAdP3rXW5PQDDhjKSkCk
 m/a5vr61iuFG4u3FC8IT4yXxqipW+bSpFZshAUESwA+g2f5R1gUSavIgaSoMuNEZ/1+AEn6SS/zgQ
 hEv1jEmWnHVt8HI0sd/IkpERtO2DZd0//QuZmCXe+JHmY++pmwOro4BaBmQj8ZIDOFzHnYatN5R3R
 sZXn9wbOIxvUz3yHqgMP0pGnbmsGdHiSdK66kQCaPcSHhuxGlfKQQbmankKnIQF4UA/fsIr9Ustpb
 nz8/7FEBkX5vk5tragU7sG5lpq4e+GJvRHVuhdirQURJGzqlMEKqZdgvNI/ARMiSDVJm2B8xNB7pi
 0dXmoTqkvODlv+gq8hn6r16B4mKbFV4dCp/fVttRCN9A6iF0sDPlPffV+PFxmH8M8jVAWWeaK+310
 vLgRWSu8aClCf7VnXPFR+UGO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDIF0-0005FB-8a
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:14 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kDIF0-00DMCU-4e
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:14 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: Improve amd64 detection on sunos
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-208@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-208@samba.org>
Date: Wed, 02 Sep 2020 02:11:09 +0000
Message-Id: <E1kDIF0-00DMCU-4e@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpJbXByb3ZlIGFtZDY0IGRldGVjdGlvbiBvbiBzdW5vcwpodHRwczovL2dpdGh1
Yi5jb20vc2FtYmEtdGVhbS9zYW1iYS9wdWxsLzIwOApEZXNjcmlwdGlvbjogU3VuT1MgbWF5IG5v
dCBpbmNsdWRlIHg4Nl82NCBvciBhbWQ2NCBpbiB1bmFtZSBvdXRwdXQuIEluc3RlYWQsIGlzYWlu
Zm8gY2FuIGJlIHVzZWQgdG8gZGV0ZXJtaW5lIGFyY2hpdGVjdHVyZS4gU3VuT1MgYWxzbyBkb2Vz
IG5vdCBzdXBwb3J0IG5vZXhlY3N0YWNrIG9wdGlvbiAodG8gbXkga25vd2xlZGdlKSBzbyB3ZSBz
a2lwIG5vZXhlY3N0YWNrIGxpbmtpbmcgY2hlY2suDQoNClNpZ25lZC1vZmYtYnk6IEFkYW0gTWFs
bGVvIDxhbWFsbGVvMjVAZ21haWwuY29tPgo=
