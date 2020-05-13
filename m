Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 843251D10EE
	for <lists+samba-technical@lfdr.de>; Wed, 13 May 2020 13:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=vvfH9q9h4/6XnAH3UcKsibDayhNN46POMBbwP8pL3kI=; b=Y4k7r0MCD3X2kmeoHSKE8ewNS1
	MODi+Qml0HGG11zOOJO7OSbtGgQAf78GP0qQQUYLGcy0jU9Kh2Ex7xyGIwG3836dwoP/iH1SnvZFb
	8IZ/fXMvVlpXm5zyjQRFK+mc7dV0GCy7S+5AfsFKjoK6MzDWOoUgkCosdcwpI3omZs9xLKJNSV4xN
	pRrrKwaA+blJxpirgrR/+LPlNcjpuYfhzQkAq+TNxEMDcHY67yphe/sUcZngw++86G36eA4GN2AK9
	yXTX7xB8BVmFmhdVALgwbVI+7ZgFtdV+mKY28VkfH0XXZQX7b/RNYoNzbHnv8lHMvbVZ+icXm2wL+
	fL/S+XzQ==;
Received: from localhost ([::1]:32474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYpL8-004CEB-22; Wed, 13 May 2020 11:14:18 +0000
Received: from devianza.investici.org ([198.167.222.108]:45045) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYpL3-004CE4-EP
 for samba-technical@lists.samba.org; Wed, 13 May 2020 11:14:15 +0000
Received: from mx2.investici.org (unknown [127.0.0.1])
 by devianza.investici.org (Postfix) with ESMTP id C92CEE0605
 for <samba-technical@lists.samba.org>; Wed, 13 May 2020 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1589368447;
 bh=vvfH9q9h4/6XnAH3UcKsibDayhNN46POMBbwP8pL3kI=;
 h=Subject:From:To:Date:From;
 b=DWfjZWssGkjgaP79c/IZynAEkvh60DbHcHPJJ93NXHKuyW92aaPlJLod3hN277ZdQ
 MgVpkoCM+GpciGd4OxQd2lbDXuaiAb/sjjvpBIbyKaJ8m5LGMeTai0iVFDnvFpJt3w
 XoDnLkRNbRQCC9fzRDcVMFs6pxvQ5BahOUuOX6yM=
Received: from [198.167.222.108] (mx2.investici.org [198.167.222.108])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 91AEDE05E9
 for <samba-technical@lists.samba.org>; Wed, 13 May 2020 11:14:06 +0000 (UTC)
Message-ID: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
Subject: Behaviour mismatch between "store dos attributes" and "map archive"
 from man smb.conf(5)
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 13 May 2020 16:42:30 +0530
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Following is a question I have regarding the interaction between two
smb.conf parameters mentioned in the $subject. It can very well be a
misunderstanding from my side.

We have both "store dos attributes" and "map archive" set to 'yes' for
default install. But according to its description man smb.conf(5):

store dos attributes (S)

. . .When this parameter is set it will override the parameters map
hidden, map system, map archive and map readonly and they will behave
as if they were set to off. . .

My question is around smb2.read.access torture test where it tries to
open a file with different access flags including SEC_FILE_EXECUTE.
When run against a share with "map archive = no"(or implicitly assumed
by "store dos attributes" set) we cannot expect execute bit to be
present for the owner. Thanks to Ralph(and Michael, Guenther) who
helped me understand basic selftest architecture which adds
vfs_acl_xattr in [global] section for many torture tests including
smb2.read making it pass with `make test`.

Nevertheless, leaving "store dos attributes" at its default, why would
smbd create file with execute bit set for the owner? I hope its not
because of some umask calculation done at the end outside Samba because
if that's the case I would expect it to be set even when "map archive"
is explicitly set to 'no'. There seems to be some mismatch between
assumed and real behaviour.

[local-ext4]
	comment = For samba share of local ext4
	path = /mnt/ext4/
	read only = No


[local-ext4-no-map-archive]
	comment = For samba share of local ext4
	map archive = No
	path = /mnt/ext4/
	read only = No

# smbclient \\\\192.168.122.101\\local-ext4 -U anoopcs%smb -c "put
/etc/motd foo; allinfo foo"
putting file /etc/motd as \foo (0.0 kb/s) (average 0.0 kb/s)
altname: foo
create_time:    Wed May 13 04:21:10 PM 2020 IST
access_time:    Wed May 13 04:21:10 PM 2020 IST
write_time:     Wed May 13 04:21:10 PM 2020 IST
change_time:    Wed May 13 04:21:10 PM 2020 IST
attributes: A (20)
stream: [::$DATA], 0 bytes

# smbclient \\\\192.168.122.101\\local-ext4-no-map-archive -U
anoopcs%smb -c "put /etc/motd bar; allinfo bar"
putting file /etc/motd as \bar (0.0 kb/s) (average 0.0 kb/s)
altname: bar
create_time:    Wed May 13 04:26:38 PM 2020 IST
access_time:    Wed May 13 04:26:38 PM 2020 IST
write_time:     Wed May 13 04:26:38 PM 2020 IST
change_time:    Wed May 13 04:26:38 PM 2020 IST
attributes: A (20)
stream: [::$DATA], 0 bytes

# ls -lh /mnt/ext4/
total 8.0K
-rw-r--r--. 1 anoopcs anoopcs 0 May 13 16:26 bar
-rwxr--r--. 1 anoopcs anoopcs 0 May 13 16:21 foo

Thanks,
Anoop C S.


