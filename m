Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED9588294
	for <lists+samba-technical@lfdr.de>; Tue,  2 Aug 2022 21:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wKwulhIx515tBs9KarM3vkMSrD1Pc01HY8nx9DrB6Ko=; b=V4eo4Yxtz7QoLKMYL5dnBu+n7Z
	3dhqHKCueXeRy4nPLwm2fRWhDOir7K1zjh2JdI3Qwl8QmOqcqomnR6zPjnBbXgd3tLdN1Fx32s4VQ
	D2VgJ8mI/qyQCbLMreOdyukj1dMn8J85mtaqOd/02dBHUkhtYvjyaW9SSf+/Y7z6BQDEGLB/CnZ40
	kDRyp+lfVVPMkqA1DkVLWQZoYruOOyVRaXAiPVG7I53kWgrOYpha7RttMaHPExxsqE2L558OBrRPl
	30BV+Dvexcu8tSMPvlMlHB0/arW14b1AD0DiLTmMhpO4n0bU0gRpfJ9ny8IMBxkAi9pdyBZGp6j+i
	SWaxY+Cg==;
Received: from ip6-localhost ([::1]:49478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIxgu-0052d8-MM; Tue, 02 Aug 2022 19:36:32 +0000
Received: from smtp-out1.suse.de ([195.135.220.28]:37416) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIxgo-0052cl-CN
 for samba-technical@lists.samba.org; Tue, 02 Aug 2022 19:36:29 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D192A3874B;
 Tue,  2 Aug 2022 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659468983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKwulhIx515tBs9KarM3vkMSrD1Pc01HY8nx9DrB6Ko=;
 b=lIxgGmgiJjHkY4CpdyLYOyrlEZr6WXWjSxUXwr7T3l6G3upE9bl6mkc06qVICbyJV25D5j
 NN6IMBnVJ2ikFzF6e3VxiEeAurK54PYq8864I4xh6dLh4NxwezB7QvuJh7TqP2aaMbzwUo
 7jVXeZ1t2Lcu0SuoH5FUysm4N4xDEv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659468983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKwulhIx515tBs9KarM3vkMSrD1Pc01HY8nx9DrB6Ko=;
 b=NQfgJ+ZFnqEBYm9kVtWA/ahzEUqSBoH97VXJ/OSSWF6JgIYf9eKq87vwjCYHFcq5dZwe0B
 VtNvgOR948PO1lAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4438713A8E;
 Tue,  2 Aug 2022 19:36:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qliOAbd86WItbAAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Tue, 02 Aug 2022 19:36:23 +0000
Date: Tue, 2 Aug 2022 16:36:20 -0300
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [RFC PATCH 0/3] Rename "cifs" module to "smbfs"
Message-ID: <20220802193620.dyvt5qiszm2pobsr@cyberdelia>
References: <20220801190933.27197-1-ematsumiya@suse.de>
 <c05f4fc668fa97e737758ab03030d7170c0edbd9.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c05f4fc668fa97e737758ab03030d7170c0edbd9.camel@kernel.org>
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
From: Enzo Matsumiya via samba-technical <samba-technical@lists.samba.org>
Reply-To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, pc@cjr.nz,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 pshilovsky@samba.org, tom@talpey.com, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 08/02, Jeff Layton wrote:
>On Mon, 2022-08-01 at 16:09 -0300, Enzo Matsumiya wrote:
>> Hi,
>>
>> As part of the ongoing effort to remove the "cifs" nomenclature from the
>> Linux SMB client, I'm proposing the rename of the module to "smbfs".
>>
>> As it's widely known, CIFS is associated to SMB1.0, which, in turn, is
>> associated with the security issues it presented in the past. Using
>> "SMBFS" makes clear what's the protocol in use for outsiders, but also
>> unties it from any particular protocol version. It also fits in the
>> already existing "fs/smbfs_common" and "fs/ksmbd" naming scheme.
>>
>> This short patch series only changes directory names and includes/ifdefs=
 in
>> headers and source code, and updates docs to reflect the rename. Other
>> than that, no source code/functionality is modified (WIP though).
>>
>> Patch 1/3: effectively changes the module name to "smbfs" and create a
>> 	   "cifs" module alias to maintain compatibility (a warning
>> 	   should be added to indicate the complete removal/isolation of
>> 	   CIFS/SMB1.0 code).
>> Patch 2/3: rename the source-code directory to align with the new module
>> 	   name
>> Patch 3/3: update documentation references to "fs/cifs" or "cifs.ko" or
>> 	   "cifs module" to use the new name
>>
>> Enzo Matsumiya (3):
>>   cifs: change module name to "smbfs.ko"
>>   smbfs: rename directory "fs/cifs" -> "fs/smbfs"
>>   smbfs: update doc references
>> ...
>
>Why do this? My inclination is to say NAK here.
>
>This seems like a lot of change for not a lot of benefit. Renaming the
>directory like this pretty much guarantees that backporting patches
>after this change to kernels that existed before it will be very
>difficult.

Hi Jeff, yes that's a big concern that I've discussed internally with my
team as well, since we'll also suffer from those future backports.

But, as stated in the commit message, and from what I gathered from
Steve, it has been an ongoing wish to have the "cifs" name no longer
associated with a module handling SMB2.0 and SMB3.0, as the name brings
back old bad memories for several users.

There really is no functional benefit for this change, and I have no
argument against that.

>Also, bear in mind that there used to be an smbfs in the kernel that
>predated cifs.ko. That was removed ~2010 though, which is long enough
>ago that it shouldn't produce conflicts in currently shipping releases.=A0

Yes, I was aware of this before sending v1, and it got raised again in
https://lore.kernel.org/all/20220802135201.4vm36drd5mp57nvv@cyberdelia/

I have no experience on what kind of issues/problems could arise of
that, aside from the git commit history being weird. If you ever seen
any problems with that happening, please do share.

>Jeff Layton <jlayton@kernel.org>

I sent a v2 with a new "fs/smb" directory name, but kept "smbfs" as the
module name.

Sorry I didn't reply to you before that, I got confused as the thread
replies all went to different folders in my mailbox.


Cheers,

Enzo

