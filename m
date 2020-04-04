Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08C19E600
	for <lists+samba-technical@lfdr.de>; Sat,  4 Apr 2020 17:06:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ghRYxnSRqOpP1kwR0YldqZD/CBa33sxaBbn24AbF+Lk=; b=O64bvcewWL+gN5onlqTiJOSujJ
	7hj+VflWwTGvliEiSP4CBXDVc1vo/+a/D6k2tE9mkZylgT6nva2yCPzjhq0c+dsixrCKOHX8mKdrT
	36XI/VPGvSoZ4eU4LsLLOIpoAFcSL5YlOwENtt/S9V0fX0duIUC7LQPDsD6LhI6toFOGnUYF20sj9
	qqZRRMa37vHuOXgjSZ/oMwY0+G5uI5u5jMmWxG7q6J3BUQHWGkjFxu1GUhM4hSfE2HEzve5GECAdH
	8w4+gztZzx8Wkih+MnHziQizCtk0+7BIZgPW8E7PsvUQ1NplFhdNhaUOnnVxPCutrClxNfstURIAi
	LjTfgQWQ==;
Received: from localhost ([::1]:38016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKkMn-003JKC-30; Sat, 04 Apr 2020 15:05:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10356) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKkMi-003JK5-NB
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 15:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=2uJOjEJ5sSgb/B5mETwAwCNQT1cGxn/yY9bEVgbAn1M=; b=U/dfOPHCrCUBm3sgpNi/ut294m
 u5xwGHP3po28SlmXIgMkl+h/zO1gJXZVs+Bso/oMvJfoVakx4F3dRqhiUsagh8Uq+lucB+d+T4oZH
 BiAj65XIRmsGyasnthLh7JQYqYdJ2L7u3q7wDsD9hcbGqXK8X2y9UMq6dFHUF7oPdCJVpLvfiMaWj
 kVcBDLhRWRbgtjLy4PdPeq3a/MIneB1zmp/Gt0lNb2z/A68O9DcNfclYFAu8D6gKbW+NEfv/mulS2
 kMhK/zalalB28eNW6t0kPt2joWMGJw1bGVybjXzxqhsk/FrH+ym5Wj8EyhdUohhGmkql4mDILflKy
 RXCpqOsSel9cqoCeKjXDH6hE0d7sxrASbyIUyVXi2dxP0z/k8DDU0eWsBSCI+Ao7MX4TG0arQba61
 B4mrcpE4WiODpSeO8B/LbG/yP7tn8pOBdlBMEKDZzEqOqbnYtFrk9AHoz9Lv4gXJLmSrQCmBcPVOd
 D57OO83Uo2UHYMF5kh9xrMr2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKkMa-0003PB-M3
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 15:05:36 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1jKkMZ-004Upz-Jg
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 15:05:36 +0000
MIME-Version: 1.0
Subject: Re: samba-tool - uncaught exception bad call flags
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-217@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-217@samba.org>
Date: Sat, 04 Apr 2020 15:05:35 +0000
Message-Id: <E1jKkMZ-004Upz-Jg@hr3.samba.org>
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

TmV3IGNvbW1lbnQgYnkgamVsbWVyIG9uIFNhbWJhIEdpdGh1YiByZXBvc2l0b3J5CgpodHRwczov
L2dpdGh1Yi5jb20vc2FtYmEtdGVhbS9zYW1iYS9wdWxsLzIxNyNpc3N1ZWNvbW1lbnQtNjA5MDQy
MTUwCkNvbW1lbnQ6CkZvciBoZWxwIHdpdGggcnVubmluZyBTYW1iYSwgcGxlYXNlIGFzayBvbiB0
aGUgbWFpbGluZyBsaXN0OiBodHRwczovL2xpc3RzLnNhbWJhLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3NhbWJhDQoNClBsZWFzZSByZXBvcnQgYnVncyBvbiBodHRwczovL2J1Z3ppbGxhLnNhbWJhLm9y
Zy8uCg==
