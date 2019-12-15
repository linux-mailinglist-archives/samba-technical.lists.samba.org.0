Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 472BA11F7BA
	for <lists+samba-technical@lfdr.de>; Sun, 15 Dec 2019 13:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VtNWogBSBECThbpMvvbkWHl2d1t1fBAYzt83+BhSYW4=; b=puptVOvDc6VVHXTLtIYinTOM9T
	p2d9HzNyq+PpFSoG8j1rQitzT5+wseLdstZbBcglBb1dV2FtCgnphaozGx6uBn4R4eTDu7Ibh5Rjc
	Wt4Rv4O856SebrAPr+4iGWm8LKRoeMByv8JZZNWSzoR/yh49yfSCQ0ZV/plw4uBzj4J6HkAOPbaaq
	s43DcFtt6raVppuctqvHrUawJ1rX66Bofyu5hLcIt2ExhcTIohxx5laoT6h53wqeRzZO5YGjNbltR
	+asugG9gB1wsxq0SOiqxU8maci8IicoD4/Sm2c8QTdmuTEFLd6MUA0A3XyUGpg8qFDl/twX1PXZaF
	FPit8uug==;
Received: from localhost ([::1]:49112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1igT1s-007Lh1-Gw; Sun, 15 Dec 2019 12:29:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44608) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igT1m-007Lgu-LQ
 for samba-technical@lists.samba.org; Sun, 15 Dec 2019 12:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=VtNWogBSBECThbpMvvbkWHl2d1t1fBAYzt83+BhSYW4=; b=WM25xDglvASL+xr7dZCYwLdv3J
 IBuzXwNOGx1fHWc+2ViFLC3nA9k9uYk1nNigb0MTGDWXOQYlsS8Ev3K7zCT8C6UpC45bV/wu5SOnq
 Gt3Uuq3URTianqnEvUlOH+aSzlPqX07PF1CwJIy3BZjej90zawI07Pduc+XtEghN91kzOVbgxxp1C
 yK39kXHs/xZn86yfwsD/M/v7wi+/hrt5VNbfKBTWp8mmZJcr5N08HUwbjaoFLRpxIQU4cCwfBamXN
 H2mxDTo5wi1qC7RY32vtRX9iUz2OwMCz5VCqNH4J1o9VxdDM9keBKhk8e7RbJD8DV0V01wi6IQqXn
 pa35jw3Qva6e5EoRG3OHz/Zc5D36QcJletmno2UDdxKhCNM5y9dMyars6Jz9UmePzXbO7ozURpNJf
 4r/zb79F9/XvosxymBX9PmfAwj1J9EwlFzJXfZDEl7ep3KpGKgvEvn25dhjoSrs6cYyzAQSaEooBp
 CrX+s6xGVihoEAuATFO7cDtL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igT1i-000571-5f; Sun, 15 Dec 2019 12:29:34 +0000
Subject: Re: parse_dos_attribute_blob() inconsistent file_id through
 make_file_id_from_itime()
To: Krasimir Ganchev <ganchev@fixity.net>
References: <BYAPR08MB4872E120915FF5A02939D29CC8550@BYAPR08MB4872.namprd08.prod.outlook.com>
 <117698c8-f1a1-5c0d-8fa5-8a0afb4745b1@samba.org>
 <BYAPR08MB487223100DE8B50DFA0EDB6AC8570@BYAPR08MB4872.namprd08.prod.outlook.com>
 <d1fa0fc3-72b9-e1cd-b139-18d5fe1e5e09@samba.org>
 <BYAPR08MB48727CE3A59EA39A14AED9B6C8570@BYAPR08MB4872.namprd08.prod.outlook.com>
Message-ID: <99db458b-38f1-d180-3e6b-2dc1e10fabe2@samba.org>
Date: Sun, 15 Dec 2019 13:29:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <BYAPR08MB48727CE3A59EA39A14AED9B6C8570@BYAPR08MB4872.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 12/14/19 um 12:25 PM schrieb Krasimir Ganchev:
> On Saturday, December 14, 2019 2:23 AM, Ralph Boehme wrote:
> 
>> Am 12/14/19 um 6:11 AM schrieb Krasimir Ganchev:
>>> On Friday, December 13, 2019 12:59 AM, Ralph Boehme wrote:
>>>> this is a recent Samba change to overcome the problematic use of inode numbers for the file-ids. The assumption was that with nsec filesystem timestamp granularity, the itime, which stands for invented time and is basically an immutable birthtime, will alway be unique.
>>>>
>>> Can you share a network trace of a minimal reproducer?
>>>
>>> I am attaching a minimal packet capture at the time the directory was browsed.
> 
>> sorry if that wasn't clear, but we also need the capture to cover when the files were created.
> 
> What more information would that give us? Apparently we are dealing with local issue on the samba side. It's 8MB file, I can provide a download link if needed, but I don't feel like blowing such an attachment here.

Just share a link where I can download the traces.

>> What's strange is that the capture shows that for files where the file-id is the same, the creation-dates are different, so I would expect the itime to be different as well which should result in unique file-ids.
> 
> If am not mistaken, I think there is still no consensus on implementing creation time on Linux, although some FS actually support it.

there's now statx() and eg btrfs supports it, but this is currently not
used in Samba.

> All you have is the change time. Creation time is copied over from Windows as a DOS attribute which in this case is irrelevant as invented time (itime) is based on the change time supplied by the FS (creation time is only used if nothing is supplied by the FS).

I was suspecting a bug in Samba where possibly if the client sets the
creation date this would somehow munge itime and file-id.

To give some context: it was me who added added the feature of basing
the file-id on a immutable itime a few months ago.

> If you look closely in the text file in the zip you will find the output of stat on each of the files and you can clearly see that itime was indeed based on the granular change time of the FS. The problem here is as I mentioned in my initial post when copying files in parallel there are definitely batches of files that get the same change time in the FS (actually maybe I was not clear enough in my initial post mentioning the creation time but I was referring to the creation time in the local FS).

Yeah, this is likely the problem. I wonder how the files end up with
identical ctime, as in Samba the file creation will be serialized so
they *can't* happen at the same time.

>> Go figure, we definitely need a network trace with *parallel* log level 10. smb.conf as well.
> 
> The problem with providing log level 10 debug is that the moment I enable level 10 debug for the particular client, due to the fact that copying becomes much slower I am unable to reproduce the issue as it takes more time to commit the files and they get different change time and itime respectively.

Drat, I see. You could try and use the ringbuffer for logging. Given a
large enough buffer, maybe the full log fits into it so you can extract
it after running the reproducer:

  logging = ringbuf:size=NBYTES

Then

  # smbcontrol PID ringbuf-log

This won't work with more then 128 MB (iirc).

> Looking at the code and the data I supplied so far (samba-tool, stat, extracts from debug) I feel we can clearly pinpoint this to generating fileids off the invented time XATTR_DOSINFO_ITIME.

As the itime is based on the ctime, the question is, how can the files
end up with identical ctime? As mentioned above, file creation in Samba
is serialized, so there's no parallelism.

>>> You can clearly see that the fileids returned are the same for files with the same timestamp (find response packet 53 from the capture).
>>>
>>> Within the attachment there is also a text file containing some part of the client debug log, stat of the shared directory contents, and samba-tool ntacl getdosinfo of each file in the directory.
> 
>> Unfortunately the output is only with seconds granularity.
> 
> This again is irrelevant because you are referring to the XATTR_DOSINFO_CREATE_TIME which is intentionally carried over as DOS attribute while copying the files.

If you look closely, the itime is there as well.

> In our case itime was not based of this DOS attribute (see the output of "samba-tool ntacl getdosinfo") in the previously attached ZIP.

For file handles referring to files just created via that handle, the
itime is taken from the ctime (lacking native btime support) and stored
in the DOS attribute xattr. Subsequently opens of the same file will use
the itime from the DOS attrubte. This itime value in the DOS attribute
is immutable once set, in contrast to the creation-date which can be
modified on client request.

>>> You mentioned the change was needed due to problematic use of inode numbers. I suppose this might be an issue with filesystems without inode table. Can you please elaborate?
> 
>> inode numbers are reused by the kernel, so they're not unique identifiers.
> 
> Correct me if I am wrong, but my understanding is that inodes are only reused after the last link to a particular inode is deleted?

Yup.

> I think this complies with the requirements for fileid in the Microsoft's whitepaper e.g. "FileId for a file MUST persist for the lifetime of a file on a given object store. A FileId MUST NOT be changed when a file is renamed. When the file is deleted, the FileId MAY be reused." 

Yes, this is sufficient for WIndows clients, unfortunately other client
assume no reuse, name the macOS client.

> If that's the case, maybe some combination of itime + inode could be a better approach except that it would still cause issues with filesystems that don't use inodes. 
> 
> I think the right thing to do here is to find a good method of generating unique fileids.

Samba has long been just using the inode number which worked fine, it's
just the macOS client that uses the server provided file-id as CNID wich
requires no number reuse.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

