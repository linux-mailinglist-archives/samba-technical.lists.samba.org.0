Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F769750080
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jul 2023 09:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FKXPKfAiUr0O2sM5Pke7XZyLqLuxX2vNc7OinoAkVUs=; b=XLtkRQYr60eRQ/h0F5zPUkXfym
	eSvkvDgUY+ydlQLWiiKwQ1J8rCRxHOMjWvOWayYXkIqo7GKZvlrQOfk31FFiTVLnlRV0E9hqttAyI
	LnVI+w4ek9ZT11Cjb42f4I9zu2puqhVJNeLkNhPU4l4q7YIfwkLI6keX3ryo39QuRJjDh8OBrQwbg
	0+0SxjhYqLDg0Ju1odWzbnv3VutBEUKD6tDqfyrLhJBBKMAZCJWTyWTnCn4BE/NIhjCOjjLXrfNg3
	NbnaW+aHJWr5QcUWMXnGxm3ebIMW9FB02wEjl/CcuKYcqP8JOC+BEgdwpGBfhFPO8w2K+2/DF2GV8
	ruWBrO9g==;
Received: from ip6-localhost ([::1]:40472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qJUhh-001JL4-IZ; Wed, 12 Jul 2023 07:56:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64926) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qJUhM-001JKU-7l; Wed, 12 Jul 2023 07:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=FKXPKfAiUr0O2sM5Pke7XZyLqLuxX2vNc7OinoAkVUs=; b=3NSjsfyL6sPR6IEzfbLZ03Ces7
 cGgSIj5OvROKl9VwSa3e1UpsVUpTxT1T4MnnjoQ4i3G2bdXnzCOuCd4Y7/uk56nvr8HnJ0RR50xvJ
 Zh7T0Ko9hHZqNzoqiyp3PjRzs1ZuyOb0eWlminlJpVSDl0QsLtILQ7anGhUK/GM/e2+tF0l5WJpqI
 Wp8DyUxoVUGNHo0vaSaniWZ7cFrjSuI/RAJ6lLp/o1/QgW2sQ/Xy//W53VzBl19ftCgdnPBtN9MeF
 aDTNhVXBkbwxMpFSRxyL0J4zEHvHmn5y3iiYWddOzpf4K/pFsA8vCltG+LMNXFeBwsdjlCp3Ev2Bz
 dWZCujCAv8Ei9CBKy8LySEl0pmyzQ0O9L9cuHl62mUzMb2EGX5HAsYbmlIvdWv6YBLJELBgTPXZf5
 cWPe+Setjo6aVwoVD4GAqOHh5VuDsp9EQ4spM4GhdmIKaWKBa7f9JVe5en/mRPZDqsxgeDSal8qF9
 HBeACckeBq0QJFuCEWF08Oed;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qJUhJ-001SvD-32; Wed, 12 Jul 2023 07:55:42 +0000
Message-ID: <dda6e2d3-0362-aefc-002c-33bb4c363147@samba.org>
Date: Wed, 12 Jul 2023 09:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Heads-up: Upcoming Samba security releases
Content-Language: de-DE, en-US
To: samba-announce@lists.samba.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates for 4.16, 
4.17 and 4.18 on Wednesday, July 19 2023. Please make sure that your 
Samba servers will be updated soon after the release!

Impacted component:
  - Winbind (CVSS 5.9, Medium)
  - DCE-RPCs and pipes (CVSS 7.5, High, 5.3, Medium, and 5.3, Medium)
  - File services (CVSS 6.8, Medium)


Cheers,
Jule Anger

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


